$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$runtime = Get-Content (Join-Path $projectRoot 'outputs/startup/runtime.json') -Raw | ConvertFrom-Json
foreach ($record in $runtime.processes) {
    $process = Get-Process -Id $record.id -ErrorAction SilentlyContinue
    if ($process -and $process.StartTime.ToUniversalTime().ToString('o') -eq $record.startTimeUtc) {
        Stop-Process -Id $process.Id
        Write-Output "Stopped $($process.ProcessName) PID $($process.Id)"
    }
}
# Database containers stay running to preserve other development connections.
