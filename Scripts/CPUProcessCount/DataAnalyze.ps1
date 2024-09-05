#TODO Import target CSV file for analyze
$file_csv = Get-ChildItem *.csv | Select-Object -Last 1
$Imported_csv = Import-Csv -Path $file_csv -Delimiter ";" 
#TODO Parse date get top 5 proc-name
$date = $null
$export_data = @()
for ($i = 0; $i -lt $Imported_csv.Count; $i++) {
    $value = $Imported_csv[$i]
    if ($date -ne $value.'date' ) {
        #TODO Create object with data
        if ($date -ne $null) {
            $new_object = New-Object System.Object
            $new_object | Add-Member -Type NoteProperty -Name 'Date' -Value $date
            $new_object | Add-Member -Type NoteProperty -Name 'sqlservr' -Value $proc1_sqlservr
            $new_object | Add-Member -Type NoteProperty -Name 'targit' -Value $proc2_targit
            $new_object | Add-Member -Type NoteProperty -Name 'cscript' -Value $proc3_cscript
            $new_object | Add-Member -Type NoteProperty -Name 'healthservice' -Value $proc4_healthservice
            $new_object | Add-Member -Type NoteProperty -Name 'msmdsrv' -Value $proc5_msmdsrv
            #TODO Add object to array
            $export_data += $new_object
        }
        $date = $value.'date'
        $proc1_sqlservr = 0
        $proc2_targit = 0
        $proc3_cscript = 0
        $proc4_healthservice = 0
        $proc5_msmdsrv = 0
    
        
    }
    else {
        if ($value.procname -eq "sqlservr") { $proc1_sqlservr = $value.proccpu }
        if ($value.procname -eq "targit.dataservice") { $proc2_targit = $value.proccpu }
        if ($value.procname -eq "cscript") { $proc3_cscript = $value.proccpu }
        if ($value.procname -eq "healthservice") { $proc4_healthservice = $value.proccpu }
        if ($value.procname -eq "msmdsrv") { $proc5_msmdsrv = $value.proccpu }
        
    }
}

#TODO Export to Excel
$export_data | Export-Excel -Path "$($file_csv.fullname).xlsx" -WorksheetName "Data" -TableStyle Medium1