$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$logRoot = Join-Path $projectRoot 'outputs/startup'
New-Item -ItemType Directory -Path $logRoot -Force | Out-Null
Start-Transcript -Path (Join-Path $logRoot 'launcher.log') -Append
$node = 'D:\application\node\node.exe'
$java = 'D:\application\jdk\17\jdk\bin\java.exe'
$hbuilder = 'D:\application\HBuilderX'
$docker = 'D:\application\docker\app\resources\bin\docker.exe'
foreach ($container in @('nomix-works-mysql','nomix-works-redis')) {
    & $docker start $container
    if ($LASTEXITCODE -ne 0) { throw "Cannot start $container" }
}
function Start-LocalService($Name, $Port, $Executable, $Arguments, $Directory) {
    $listener = Get-NetTCPConnection -State Listen -LocalPort $Port -ErrorAction SilentlyContinue
    if ($listener) { throw "Port $Port is already occupied; refusing to start $Name" }
    $process = Start-Process -FilePath $Executable -ArgumentList $Arguments -WorkingDirectory $Directory -WindowStyle Hidden -RedirectStandardOutput (Join-Path $logRoot "$Name.log") -RedirectStandardError (Join-Path $logRoot "$Name-error.log") -PassThru
    return $process
}
$started = @()
try {
    $started += Start-LocalService 'backend' 48080 $java @('-Dfile.encoding=UTF-8','-Xms256m','-Xmx1024m','-jar','nomix-server/target/nomix-server.jar','--server.address=127.0.0.1','--spring.redis.port=6379','--spring.boot.admin.client.enabled=false') $projectRoot
    $env:VITE_OPEN = 'false'
    $started += Start-LocalService 'admin' 5173 $node @('node_modules/vite/bin/vite.js','--mode','env.local','--host','127.0.0.1','--port','5173','--strictPort') (Join-Path $projectRoot 'nomix-ui/nomix-ui-admin-vue3')
    $env:HX_APP_ROOT = $hbuilder
    $env:UNI_INPUT_DIR = Join-Path $projectRoot 'nomix-ui/nomix-ui-mall-uniapp'
    $env:UNI_OUTPUT_DIR = Join-Path $env:UNI_INPUT_DIR 'unpackage/dist/dev/h5'
    $env:UNI_HBUILDERX_PLUGINS = Join-Path $hbuilder 'plugins'
    $env:NODE_ENV = 'development'
    $env:NODE_PATH = Join-Path $hbuilder 'plugins/uniapp-cli-vite/node_modules'
    $started += Start-LocalService 'mall' 3000 (Join-Path $hbuilder 'plugins/node/node.exe') @((Join-Path $hbuilder 'plugins/uniapp-cli-vite/node_modules/@dcloudio/vite-plugin-uni/bin/uni.js'),'-p','h5','--host','127.0.0.1','--port','3000') (Join-Path $hbuilder 'plugins/uniapp-cli-vite')
    [ordered]@{adminUrl='http://127.0.0.1:5173';mallUrl='http://127.0.0.1:3000';backendUrl='http://127.0.0.1:48080';backendPid=$started[0].Id;adminPid=$started[1].Id;mallPid=$started[2].Id;launcherPid=$PID;processes=@($started | ForEach-Object { @{id=$_.Id;startTimeUtc=$_.StartTime.ToUniversalTime().ToString("o")} });mysqlContainer='nomix-works-mysql';redisContainer='nomix-works-redis';redisPort=6379} | ConvertTo-Json | Set-Content (Join-Path $logRoot 'runtime.json') -Encoding utf8
    Wait-Process -Id $started.Id
} finally {
    foreach ($process in $started) { if (!$process.HasExited) { Stop-Process -Id $process.Id -ErrorAction SilentlyContinue } }
    Stop-Transcript
}
