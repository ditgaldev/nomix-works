$ErrorActionPreference='Stop'
$env:NODE_ENV='development'
$p=Start-Process -FilePath 'D:/application/node/node.exe' -ArgumentList @('--max-old-space-size=768','node_modules/@dcloudio/vite-plugin-uni/bin/uni.js','-p','h5','--host','127.0.0.1','--port','9000','--strictPort') -WorkingDirectory 'D:/nomix/code/nomix-works/nomix-ui/nomix-ui-admin-uniapp' -WindowStyle Hidden -RedirectStandardOutput 'D:/nomix/code/nomix-works/outputs/startup/mobile-admin.log' -RedirectStandardError 'D:/nomix/code/nomix-works/outputs/startup/mobile-admin-error.log' -PassThru
@{pid=$p.Id;url='http://127.0.0.1:9000';startTimeUtc=$p.StartTime.ToUniversalTime().ToString('o')} | ConvertTo-Json | Set-Content 'D:/nomix/code/nomix-works/outputs/startup/mobile-admin-runtime.json'
Wait-Process -Id $p.Id

