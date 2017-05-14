$env:PSModulePath = $env:PSModulePath + ";C:\data\WindowsPowerShell\Modules" 

Add-PSSnapin Quest.ActiveRoles.ADManagement

Import-Module BitsTransfer
 

$lib = "C:\data\WindowsPowerShell\lib\"
$pstools = "C:\data\WindowsPowerShell\PSTools"

#set-alias -Name Edit-File -Value "C:\Program Files (x86)\Notepad++\notepad++.exe" -Force
#set-alias -Name e -Value "C:\Program Files (x86)\Notepad++\notepad++.exe" -Force
#set-alias -Name Edit-File -Value "C:\Program Files\SAPIEN Technologies, Inc\PrimalPad 2014\PrimalPad.exe" -Force
#set-alias -Name e -Value "C:\Program Files\SAPIEN Technologies, Inc\PrimalPad 2014\PrimalPad.exe" -Force
set-alias -Name Edit-File -Value "C:\Program Files\Sublime Text 3\sublime_text.exe" -Force
set-alias -Name e -Value "C:\Program Files\Sublime Text 3\sublime_text.exe" -Force
set-alias -Name subl -Value "C:\Program Files\Sublime Text 3\sublime_text.exe" -Force

Set-Alias -Name scp -Value "C:\Program Files\VanDyke Software\ClientPack\vcp" -Force
Set-Alias -Name ssh -Value "C:\Program Files\VanDyke Software\ClientPack\vsh" -Force
Set-Alias -Name tf -Value "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\tf.exe" -Force

# . "C:\data\WindowsPowerShell\lib\ssh.ps1"
. "C:\data\WindowsPowerShell\lib\sign.ps1"
# . "C:\data\WindowsPowerShell\lib\topmost.ps1"
. "C:\data\WindowsPowerShell\lib\loads.ps1"
. "C:\data\WindowsPowerShell\lib\Out-Excel.ps1"

$def = @"
public class ClientCertWebClient : System.Net.WebClient
{
   System.Net.HttpWebRequest request = null;
   System.Security.Cryptography.X509Certificates.X509CertificateCollection certificates = null;
    protected override System.Net.WebRequest GetWebRequest(System.Uri address)
    {
        request = (System.Net.HttpWebRequest)base.GetWebRequest(address);
        if (certificates != null)
        {
            request.ClientCertificates.AddRange(certificates);
        }
        return request;
    }
    public void AddCerts(System.Security.Cryptography.X509Certificates.X509Certificate[] certs)
    {
        if (certificates == null)
        {
            certificates = new System.Security.Cryptography.X509Certificates.X509CertificateCollection();
        }
        if (request != null)
        {
            request.ClientCertificates.AddRange(certs);
        }
        certificates.AddRange(certs);
    }
}
"@
Add-Type -TypeDefinition $def
$wc = New-Object ClientCertWebClient
$certs = dir cert:\CurrentUser\My
$wc.AddCerts($certs)
$wcresult = $wc.DownloadString("https://localhost:12984/keepass/entry/E048F0F148805F47A6D9D2C8658189CB")
$credjsonstring = $wcresult | ConvertFrom-Json
$username = $credjsonstring.Username
$password = $credjsonstring.Password
$acred = New-Object System.Management.Automation.PSCredential -ArgumentList @($username,(ConvertTo-SecureString -String $password -AsPlainText -Force))
Connect-QADService int.gematik.de -Credential $acred

# cleanup cleartext variables
# Remove-Variable $username 
# Remove-Variable $password
# Remove-Variable $wcresult
# Remove-Variable $credjsonstring

function global:prompt {
    # our theme
    $cdelim = [ConsoleColor]::DarkCyan
    $chost = [ConsoleColor]::Green
    $cloc = [ConsoleColor]::Cyan
    write-host "$([char]0x0A7) " -n -f $cloc
    write-host ([net.dns]::GetHostName()) -n -f $chost
    write-host ' {' -n -f $cdelim
    # write-host (shorten-path (pwd).Path) -n -f $cloc
	write-host (pwd).Path -n -f $cloc
    write-host '}'  -f $cdelim
	Write-Host ":~#" -NoNewline -ForegroundColor $cdelim
    return ' '
}

function shorten-path([string] $path) { 
   $loc = $path.Replace($HOME, '~') 
   # remove prefix for UNC paths 
   $loc = $loc -replace '^[^:]+::', '' 
   # make path shorter like tabs in Vim, 
   # handle paths starting with \\ and . correctly 
   # return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2') 
   # return ($loc -replace �\\(\.?)([^\\]{3})[^\\]*(?=\\)�,'\$1$2')
   return $loc
}


function big(){
$pshost = get-host
$pswindow = $pshost.ui.rawui
$newsize = $pswindow.buffersize
$newsize.height = 60
$newsize.width = 180
$pswindow.buffersize = $newsize
$newsize = $pswindow.windowsize
$newsize.height = 60
$newsize.width = 180
$pswindow.windowsize = $newsize
}

function small(){
$pshost = get-host
$pswindow = $pshost.ui.rawui
$newsize = $pswindow.windowsize
$newsize.height = 24
$newsize.width = 80
$pswindow.windowsize = $newsize
$newsize = $pswindow.buffersize
$newsize.height = 24
$newsize.width = 80
$pswindow.buffersize = $newsize
}

# if(Test-Path Function:\Prompt) {Rename-Item Function:\Prompt PrePoshGitPrompt -Force}

# Load posh-git example profile
# . 'C:\tools\poshgit\dahlbyk-posh-git-869d4c5\profile.example.ps1'

# Rename-Item Function:\Prompt PoshGitPrompt -Force
# function Prompt() {if(Test-Path Function:\PrePoshGitPrompt){++$global:poshScope; New-Item function:\script:Write-host -value "param([object] `$object, `$backgroundColor, `$foregroundColor, [switch] `$nonewline) " -Force | Out-Null;$private:p = PrePoshGitPrompt; if(--$global:poshScope -eq 0) {Remove-Item function:\Write-Host -Force}}PoshGitPrompt}
