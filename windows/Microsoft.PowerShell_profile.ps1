# $env:PSModulePath = $env:PSModulePath + ";C:\data\WindowsPowerShell\Modules"

# Add-PSSnapin VeeamPSSnapin
# Add-PSSnapin Quest.ActiveRoles.ADManagement

# Import-Module BitsTransfer

# $lib = "C:\data\WindowsPowerShell\lib\"
# $pstools = "C:\data\WindowsPowerShell\PSTools"

# . "C:\data\WindowsPowerShell\lib\sign.ps1"
# . "C:\data\WindowsPowerShell\lib\loads.ps1"

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

#function vcsa-admin {
#    Clear-Variable username -ErrorAction SilentlyContinue
#    Clear-Variable password -ErrorAction SilentlyContinue
#    Clear-Variable wcresult -ErrorAction SilentlyContinue
#    Clear-Variable wc -ErrorAction SilentlyContinue
#    Clear-Variable credjsonstring -ErrorAction SilentlyContinue
#    $wc = New-Object ClientCertWebClient
#    $certs = dir cert:\CurrentUser\My
#    $wc.AddCerts($certs)
#    $wcresult = $wc.DownloadString("https://localhost:12984/keepass/entry/6A6D8747428B614DBE021470D5DE8FF6")
#    $credjsonstring = $wcresult | ConvertFrom-Json
#    $username = $credjsonstring.Username
#    $password = $credjsonstring.Password
#    connect-viserver vcsa-01 -User $username -Password $password
#    Clear-Variable username -ErrorAction SilentlyContinue
#    Clear-Variable password -ErrorAction SilentlyContinue
#    Clear-Variable wcresult -ErrorAction SilentlyContinue
#    Clear-Variable wc -ErrorAction SilentlyContinue
#    Clear-Variable credjsonstring -ErrorAction SilentlyContinue
#}

#function connect-exchange {
#    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://server.domain.tld/PowerShell/ -Authentication Kerberos -Credential (Get-Credential)
#    Import-PSSession $Session -DisableNameChecking
#}

function global:prompt {
    # our theme
    $cdelim = [ConsoleColor]::DarkCyan
    $chost = [ConsoleColor]::Green
    $cloc = [ConsoleColor]::Cyan
    $cvcenter = [ConsoleColor]::Yellow
    write-host "$([char]0x0A7) " -NoNewline -ForegroundColor $cloc
    $PSName = '(' + $PSVersionTable.PSVersion + ') '
    Write-Host $PSName -NoNewline
    write-host ([net.dns]::GetHostName()) -NoNewline -ForegroundColor $chost
    if ($global:DefaultVIServer) {
        $vcenterstring = ' [' + $global:DefaultVIServer.User + '@' + $global:DefaultVIServer.Name + ']'
        write-host $vcenterstring -NoNewline -ForegroundColor $cvcenter
    }
    write-host ' {' -NoNewline -ForegroundColor $cdelim
    write-host (Get-Location).Path -NoNewline -ForegroundColor $cloc
    write-host '}'  -ForegroundColor $cdelim
    Write-Host "$([char]0x2588)$([char]0xE0B0)" -NoNewline -ForegroundColor $cdelim
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

function Connect-RDP {
    param (
        [Parameter(Mandatory=$true)]
        $ComputerName,

        [System.Management.Automation.Credential()]
        $Credential
    )

    $ComputerName | ForEach-Object {

        if ($PSBoundParameters.ContainsKey('Credential'))
        {
            $User = $Credential.UserName
            $Password = $Credential.GetNetworkCredential().Password
            cmdkey.exe /generic:$_ /user:$User /pass:$Password
        }
        mstsc.exe /v $_ /f
    }
}

Set-Alias -Name rdp -value Connect-RDP

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
