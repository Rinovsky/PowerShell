try{

    $fileExe = ".\Setup.exe"
    $conf = ".\conf-Office2019-x64.xml"
    
    & $fileExe  /configure $conf
    }catch{Write-Error $_}
    pause