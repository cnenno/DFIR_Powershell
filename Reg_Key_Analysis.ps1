##################################################
#### SUPER AWESOME REGISTRY COMPARISON SCRIPT ####
########## BY COREY NENNO, Cyber Sec Engineer ####
##################################################

#AS ALWAYS
#do this first
#change the paths to make them relevant to your search
#then if needed add the two lines below.
#Update-Help -Verbose -Force -ErrorAction SilentlyContinue           UNPOUND THIS WHEN NEEDED
#Set-ExecutionPolicy -ExecutionPolicy Unrestricted                   UNPOUND THIS WHEN NEEDED

Get-ChildItem -path 'HKLM:\HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\' -ErrorAction SilentlyContinue > C:\Users\Student\Desktop\baseline.txt
Get-ChildItem -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ -ErrorAction SilentlyContinue >> C:\Users\Student\Desktop\baseline.txt
Get-ChildItem -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\' -ErrorAction SilentlyContinue >> C:\Users\Student\Desktop\baseline.txt
Get-ChildItem -path HKLM:\SYSTEM\CurrentControlSet\Enum\USB\ -Recurse -ErrorAction SilentlyContinue >> C:\Users\Student\Desktop\baseline.txt
Get-ChildItem -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles\' -Recurse -ErrorAction SilentlyContinue >> C:\Users\Student\Desktop\baseline.txt
Get-ChildItem -path HKU:\ -Recurse -ErrorAction SilentlyContinue >> C:\Users\Student\Desktop\baseline.txt
Get-ChildItem -path HKCU:\Software\Microsoft\Windows\ -Recurse -ErrorAction SilentlyContinue >> C:\Users\Student\Desktop\baseline.txt
#echo "hello" >> C:\Users\Student\Desktop\baseline.txt             #THIS WAS A TEST LINE INCLUDED TO GET A BASE OF COMPARISON

#Start-Sleep 10                                                    #THIS WAS A TEST LINE INCLUDED TO GET A BASE OF COMPARISON
Pause

Get-ChildItem -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\' -ErrorAction SilentlyContinue > C:\Users\Student\Desktop\after.txt
Get-ChildItem -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ -ErrorAction SilentlyContinue >> C:\Users\Student\Desktop\after.txt
Get-ChildItem -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce\ -ErrorAction SilentlyContinue >> C:\Users\Student\Desktop\after.txt
Get-ChildItem -path HKLM:\SYSTEM\CurrentControlSet\Enum\USB\ -Recurse -ErrorAction SilentlyContinue >> C:\Users\Student\Desktop\after.txt
Get-ChildItem -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles\' -ErrorAction SilentlyContinue >> C:\Users\Student\Desktop\after.txt
Get-ChildItem -path HKU:\ -Recurse -ErrorAction SilentlyContinue >> C:\Users\Student\Desktop\after.txt
Get-ChildItem -path HKCU:\Software\Microsoft\Windows\ -Recurse -ErrorAction SilentlyContinue >> C:\Users\Student\Desktop\after.txt
#Start-Sleep 5                                                    #THIS WAS A TEST LINE INCLUDED TO GET A BASE OF COMPARISON

Write-Output (Compare-Object (Get-Content C:\Users\Student\Desktop\baseline.txt)(Get-Content C:\users\Student\Desktop\after.txt))







## THESE ARE EXAMPLE KEY REGISTRIES THAT WERE DIRECTLY AFFECTED. FOR TARGETING PURPOSES ONLY

## HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
## HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
## HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
## HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce