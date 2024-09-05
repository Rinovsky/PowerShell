#Remove all tasks from spool & restart Service
try {
    $OSDrive = $env:SystemDrive
    Get-Service *spool* | Stop-Service -Force
    Start-Sleep -Seconds 5
    $path = "$OSDrive\Windows\System32\spool\PRINTERS\"
    Get-ChildItem $path -File | Remove-Item -Force 
    Get-Service Spooler | Start-Service
    Write-Output "SpoolService successful cleaned up & restarted"
}
catch
{
    "Error - FixSpool"
    $_
}
