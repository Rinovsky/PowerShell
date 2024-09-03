$Hours = 1
$minutes = 0
$quatters = 0
$cores = (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors
if (($cores -eq $null) -and ($env:computername -eq "windows2008")) {
    $cores = 2
}
while ($true) {
    #TODO Check Date & Time for recive data
    $quatter++
    if ($quatter % 4 -eq 0)
    { $minutes++ }    
    Write-Host (get-date)+ " minutes:$minutes"
    $date = get-date -format "dd-MM-yyyy HH-mm"
    $cpu = get-counter "\Process(*)\% Processor Time" -erroraction silentlycontinue -SampleInterval 1 -MaxSamples 15 `
    | Select-Object -ExpandProperty CounterSamples | Group-Object -Property InstanceName `
    | ForEach-Object { $_ | Select-Object -Property Name, @{n = 'CPU'; e = { [math]::Round((($_.Group.CookedValue | Measure-Object -Average).Average / $cores), 0) } } } `
    | Where-Object { $_.CPU -ge 1 } | Sort-Object CPU -Descending 
    #$cpu
    $FJfolder = New-Item -Path "c:\tmp\CPU-Mon" -ItemType Directory -Force -erroraction SilentlyContinue 
    $LogDate = "c:\tmp\CPU-Mon" + (get-date -format "dd-MM-yyyy") + ".csv"
    #To Do Sort Process name
    if (-not (Test-Path $LogDate -PathType Leaf)) {
        Add-Content -Path $LogDate -Value "date;procname;proccpu"
        
    }
    foreach ($proc in $cpu) {
        Add-Content -Path $LogDate -Value ($date + ";" + $proc.name + ";" + $proc.cpu)
        #($date+";"+$proc.name+";"+$proc.cpu)
    }
    if ($minutes -eq (60*$Hours)) { break }
}
Write-Host "You may recive files in c:\Fujitsu\CPU-Mon\"