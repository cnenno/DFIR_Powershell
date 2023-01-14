## This is a method for setting your policy, then remoting into a remote host, and allowing that connection.

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
Netsh firewall set service remoteadmin enable
enable-PSRemoting -force
Set-Service WinRM -StartupType Automatic
set-netconnectionprofile -networkcategory private
new-pssession -Computername 10.10.10.107 -Credential (Get-Credential)
Enter-PSSession -Computername 10.10.10.107 -Credential (Get-Credential) 
Credentials are Administrator P@ssw0rd
Set-Item WSMan:\localhost\Client\TrustedHosts -Value *
