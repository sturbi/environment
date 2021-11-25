powershell.exe -command "&{Set-ExecutionPolicy RemoteSigned -force}"
powershell.exe -command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
powershell.exe -file c:\data\ad-inst\win-wsb.ps1
net use S: \\live.sysinternals.com\tools