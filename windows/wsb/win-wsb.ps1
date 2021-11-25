Install-PackageProvider -name nuget -force -forcebootstrap -scope allusers
Update-Module PackageManagement,PowerShellGet -force

Start-Process -FilePath "C:\ProgramData\Chocolatey\bin\choco.exe" -ArgumentList "install -y firefox putty 7zip vim git vscode microsoft-windows-terminal sysinternals powershell-preview" -Wait

#$file = Join-Path -path $env:temp -child 'VSCodeSetup-x64.exe'
#Invoke-WebRequest -Uri "https://update.code.visualstudio.com/latest/win32-x64-user/stable" -OutFile $file -DisableKeepAlive -usebasicparsing

#$loadInf = '@
#[Setup]
#Lang=english
#Dir=C:\Program Files\Microsoft VS Code
#Group=Visual Studio Code
#NoIcons=0
#Tasks=desktopicon,addcontextmenufiles,addcontextmenufolders,addtopath
#@'

#$infPath = Join-Path -path $env:TEMP -child load.inf
#$loadInf | Out-File $infPath

#Start-Process -FilePath $file -ArgumentList "/VERYSILENT /LOADINF=${infPath}" -Wait

#add extensions
Start-Process -filepath "C:\Program Files\Microsoft VS Code\bin\code.cmd" -ArgumentList "--install-extension ms-vscode.powerShell"
