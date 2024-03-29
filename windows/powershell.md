```powershell
Linked Clones bauen

For ($i=6; $i -lt 26; $i++ ) {
    $VM = "office0$i"
    New-VM -Name $VM -VM $VM -ReferenceSnapshot "snap" -ResourcePool "office" -OSCustomizationSpec "Windows_Domain" -Location "temp" -Datastore "Datastore001" -LinkedClone
}

get-vm | Get-Snapshot | where{$_.Name.Length -gt 0 } | select Vm,Name,Description,Created

Get-VM | Get-VMResourceConfiguration | where {$_.MemLimitMB -ne "-1"}

Rescan Cluster Storage

Get-VMHost -Location Cluster | Get-VMHostStorage -RescanAllHba

CD-Drives unmounten

Get-VM | Get-CDDrive | ? { $_.ConnectionState.Connected -eq "true" } | Set-CDDrive -Connected:$false -Confirm:$false

?Snapshost zeigen

Get-VM | Get-Snapshot | Get-HardDisk | % { $_.filename }

VMs mit CD-Rom

Get-CDDrive | where {$_.ConnectionState.Connected -eq $true}

Snapshots über 7 Tage

$today = Get-Date

Get-VM | Get-Snapshot | where { $_.Created -le ($today.AddDays(-7))} | Get-HardDisk | % { $_.filename }

NTP Services auf Nodes prüfen

Get-VMHost -Server vcenter.intern.studivz.net | Get-VMHostService | where {($_.key -eq "ntpd") -and ($_.Running -eq $false)} | ft vmhost, running, required -AutoSize


Get-VM | Get-NetworkAdapter | Where {$_.MacAddress -eq “00:50:56:12:34:56”} | Select-Object Parent,Name,MacAddress


Get-VirtualPortGroup -standard | select Name,VLanID | sort -Property VLanID | sort -Unique Name | Out-GridView

Get-VMhost $esxhost | Get-ScsiLun -LunType disk | Where { $_.MultipathPolicy -notlike "RoundRobin" } | Select CanonicalName,MultipathPolicy
Get-VMhost $esxhost | Get-ScsiLun -LunType disk | Where { $_.MultipathPolicy -notlike "RoundRobin" } | Set-ScsiLun -MultipathPolicy "RoundRobin"

$esxcli.storage.nmp.satp.list()
$esxcli.storage.nmp.satp.set($null, 'VMW_PSP_RR', 'VMW_SATP_ALUA')


Get-QADComputer -ComputerRole DomainController | foreach { 
 get-qaduser -sizeLimit 0 | Where-Object { $_.lastlogon -lt (get-date).AddDays(-90) } 
} | select-object -unique

Get-QADUser -InactiveFor 90 -Enabled | select Name, ParentContainer, LastLogon | Export-Csv -Path C:\temp\inactive-user.csv


get-vm | get-view | %{$_.Config } | select Name, GuestId, GuestFullName | Export-Csv -Path C:\temp\vm-os.csv


Foreach ($v in (get-vm)) {
$vm = $v | Get-View
$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
$vmConfigSpec.Tools = New-Object VMware.Vim.ToolsConfigInfo
$vmConfigSpec.Tools.ToolsUpgradePolicy = "UpgradeAtPowerCycle"
$vm.ReconfigVM($vmConfigSpec)
}
```
