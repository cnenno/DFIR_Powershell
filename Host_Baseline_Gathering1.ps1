##################################################
#### SUPER AWESOME BASELINE COMPARISON SCRIPT ####
########## BY COREY NENNO, Cyber Sec Engineer ####
##################################################

#AS ALWAYS
#do this first
#Update-Help -Verbose -Force -ErrorAction SilentlyContinue           UNPOUND THIS WHEN NEEDED
#Set-ExecutionPolicy -ExecutionPolicy Unrestricted                   UNPOUND THIS WHEN NEEDED


### THIS IS THE BASELINE ANALYSIS PORTION
### IT WILL GATHER ALL NECESSARY CATEGORIES
### THEN STOP AT A READ-HOST PROMPT
### TO LET YOU KNOW IT HAS COMPLETED

$a = $(Write-Output `n
Write-Output '-----------BASELINE-----------'
Write-Output '-----------1) System Date & Time-----------'
Get-Date
Write-Output `n
Write-Output '-----------2) Hostname-----------'
Get-Host | Select-Object Name, Version
get-childitem -Path env:computername
Write-Output `n
Write-Output '-----------3) Users-----------'
Get-LocalUser | Select-Object Name, SID | Format-Table -AutoSize
Write-Output `n
Write-Output '-----------4) Groups-----------'
Get-LocalGroup | Select-Object Name | Format-Table -AutoSize
Write-Output `n
Write-Output '-----------5) Logged on Users-----------'
Get-WmiObject -Class Win32_ComputerSystem | Select Username
Write-Output `n
Write-Output '-----------6) Running Processes-----------'
Get-Process | Select-Object -Property ProcessName -Unique | Format-Table -AutoSize
Write-Output `n
Write-Output '-----------7) Services & States-----------'
Get-Service | Where-Object 'Status' -EQ 'Running' | Format-Table -AutoSize
Write-Output `n
Write-Output '-----------8) Network Information-----------'
Get-NetIPConfiguration
Write-Output `n
Write-Output '-----------9) Listening Sockets-----------'
Get-NetTCPConnection -State Listen | Select-Object -Property LocalAddress,LocalPort,RemoteAddress,State,OwningProcess | Format-Table -AutoSize
Write-Output `n
Write-Output '-----------10) System configuration info-----------'
Get-CimInstance Win32_OperatingSystem | Select-Object -Property SystemDirectory, BuildNumber, RegisteredUser, SerialNumber, Version
Write-Output `n
Write-Output '-----------11) Local Drives-----------'
###I added this to the list for a good comparison to mapped drives
Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{n="Root"; e={if ($_.DisplayRoot -eq $null) {$_.Root} else {$_.DisplayRoot}}}
Write-Output `n
Write-Output '-----------12) Mapped Drives-----------'
Get-Wmiobject -Class Win32_MappedLogicalDisk | Select Name, ProviderName
Write-Output `n
Write-Output '-----------13) Plug and play devices-----------'
Get-PnpDevice | Select-Object -Property Status,Class,FriendlyName -Unique | Format-Table -AutoSize
Write-Output `n
Write-Output '-----------14) Shared Resources-----------'
Get-WmiObject -Class Win32_Share
Write-Output `n
Write-Output '-----------15) Scheduled Tasks-----------'
Get-ScheduledTask | Select-Object -Property State,TaskName | Format-Table -AutoSize
Write-Output `n)

### THIS IS WHERE IT WILL OUTPUT ALL INFO TO A FILE
### AS A BASELINE TO COMPARE TO
Write-Output $a | Out-file $env:HOMEPATH\Baseline.docx


### THIS IS THE PAUSE TO ALLOW FOR CHANGES FOR TESTING PURPOSES
### USE THIS TIME TO ADD/DELETE USERS, OPEN PROCESSES, ETC.
Read-Host -Prompt "Baseline Complete. Do some stuff, then press enter to continue"


### THIS IS THE CHANGES ANALYSIS PORTION
### IT WILL GATHER ALL NECESSARY CATEGORIES
### THEN STOP AT A READ-HOST PROMPT
### TO LET YOU KNOW IT HAS COMPLETED

$b = $(Write-Output `n
Write-Output '-----------CHANGES-----------'
Write-Output '-----------1. System Date & Time-----------'
Get-Date
Write-Output `n
Write-Output '-----------2. Hostname-----------'
Get-Host | Select-Object Name, Version
get-childitem -Path env:computername
Write-Output `n
Write-Output '-----------3. Users-----------'
Get-LocalUser | Select-Object Name, SID | Format-Table -AutoSize
Write-Output `n
Write-Output '-----------4. Groups-----------'
Get-LocalGroup | Select-Object Name | Format-Table -AutoSize
Write-Output `n
Write-Output '-----------5. Logged on Users-----------'
Get-WmiObject -Class Win32_ComputerSystem | Select Username
Write-Output `n
Write-Output '-----------6. Running Processes-----------'
Get-Process | Select-Object -Property ProcessName -Unique | Format-Table -AutoSize
Write-Output `n
Write-Output '-----------7. Services & States-----------'
Get-Service | Where-Object 'Status' -EQ 'Running' | Format-Table -AutoSize
Write-Output `n
Write-Output '-----------8. Network Information-----------'
Get-NetIPConfiguration
Write-Output `n
Write-Output '-----------9. Listening Sockets-----------'
Get-NetTCPConnection -State Listen | Select-Object -Property LocalAddress,LocalPort,RemoteAddress,State,OwningProcess | Format-Table -AutoSize
Write-Output `n
Write-Output '-----------10. System configuration info-----------'
Get-CimInstance Win32_OperatingSystem | Select-Object -Property SystemDirectory, BuildNumber, RegisteredUser, SerialNumber, Version
Write-Output `n
Write-Output '-----------11. Local Drives-----------'
###I added this to the list for a good comparison to mapped drives
Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{n="Root"; e={if ($_.DisplayRoot -eq $null) {$_.Root} else {$_.DisplayRoot}}}
Write-Output `n
Write-Output '-----------12. Mapped Drives-----------'
Get-Wmiobject -Class Win32_MappedLogicalDisk | Select Name, ProviderName
Write-Output `n
Write-Output '-----------13. Plug and play devices-----------'
Get-PnpDevice | Select-Object -Property Status,Class,FriendlyName -Unique | Format-Table -AutoSize
Write-Output `n
Write-Output '-----------14. Shared Resources-----------'
Get-WmiObject -Class Win32_Share
Write-Output `n
Write-Output '-----------15. Scheduled Tasks-----------'
Get-ScheduledTask | Select-Object -Property State,TaskName | Format-Table -AutoSize
Write-Output `n `n)

### THIS IS WHERE IT WILL OUTPUT ALL INFO TO A FILE
### AS THE CHANGES TO COMPARE TO THE BASELINE
Write-Output $b | Out-file $env:HOMEPATH\Changes.docx

### THIS IS THE PAUSE TO NOTIFY BOTH PORTIONS OF
### THE SCRIPT HAS COMPLETED
Write-Host 'System Changes Assessed and completed.'