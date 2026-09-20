$ErrorActionPreference='Stop'
$env:VITE_OPEN='false'
$p=Start-Process -FilePath 'D:/application/node/node.exe' -ArgumentList @('node_modules/vite/bin/vite.js','--mode','env.local','--host','127.0.0.1','--port','5173','--strictPort') -WorkingDirectory 'D:/nomix/code/nomix-works/nomix-ui/nomix-ui-admin-vue3' -WindowStyle Hidden -RedirectStandardOutput 'D:/nomix/code/nomix-works/outputs/startup/admin.log' -RedirectStandardError 'D:/nomix/code/nomix-works/outputs/startup/admin-error.log' -PassThru
@{pid=$p.Id;startTimeUtc=$p.StartTime.ToUniversalTime().ToString('o');url='http://127.0.0.1:5173'} | ConvertTo-Json | Set-Content 'D:/nomix/code/nomix-works/outputs/startup/admin-runtime.json'
Wait-Process -Id $p.Id
