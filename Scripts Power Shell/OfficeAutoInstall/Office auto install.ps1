<<<<<<<< HEAD:Scripts Power Shell/Office auto install.ps1

try{

$fileExe = ".\Setup.exe"
$conf = ".\conf-Office2019-x64.xml"

& $fileExe  /configure $conf
}catch{Write-Error $_}
========
try{

$fileExe = ".\Setup.exe"
$conf = ".\conf-Office2019-x64.xml"

& $fileExe  /configure $conf
}catch{Write-Error $_}
>>>>>>>> DEV:Scripts Power Shell/Office auto install
pause