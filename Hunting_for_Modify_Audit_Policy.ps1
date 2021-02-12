## DFIR Style hunt for specific firewall information
## that could show signs or evidence of intrusion

auditpol /set /subcategory:"Credential Validation" /success:disable /failure:disable
set-Netfirewallrule -DisplayName TELNET -Action Allow
Get-WinEvent -Logname "Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" | Where-Object -Property TimeCreated -match "4/18/2018"