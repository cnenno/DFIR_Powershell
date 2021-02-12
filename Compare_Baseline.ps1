##################################################
#### SUPER AWESOME OVERALL COMPARISONS SCRIPT ####
########## BY COREY NENNO, Cyber Sec Engineer ####
##################################################


###This will take the input of the baseline document and compare it to the Changes document
###this can be used in conjunction with the DFIR_Host_Baseline_Gathering1 script
###you will just need to make use the paths and file types line up
###Then output the differences cleanly, marked by whats different for each document

$c = (Write-Output (Compare-Object (Get-Content $env:HOMEPATH\Baseline.docx)(Get-Content $env:HOMEPATH\Changes.docx) | select -ExpandProperty inputobject -ExcludeProperty outputobject))
Write-Output $c | Out-file $env:HOMEPATH\OverallEffectiveChanges.docx


