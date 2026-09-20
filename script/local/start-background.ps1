$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$scriptPath = Join-Path $PSScriptRoot 'start.ps1'
$shellPath = (Get-Process -Id $PID).Path
$commandLine = '"' + $shellPath + '" -NoProfile -WindowStyle Hidden -File "' + $scriptPath + '"'
$result = Invoke-CimMethod -ClassName Win32_Process -MethodName Create -Arguments @{CommandLine=$commandLine;CurrentDirectory=$projectRoot}
if ($result.ReturnValue -ne 0) { throw "Background startup failed: $($result.ReturnValue)" }
Write-Output "Launcher PID: $($result.ProcessId). Logs: $projectRoot\outputs\startup"
