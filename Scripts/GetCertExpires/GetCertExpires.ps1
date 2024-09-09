#NAME=Сертификаты в LocalMachine\My

function PrintExpires ([string]$path) {
    
    $CertListToExport = Get-ChildItem -Path $path

    ""
    " Expires certificates in $path"
    "="*60
    
    foreach ($CertToExport in $CertListToExport) {
        $EprireDate = Get-Date $CertToExport.GetExpirationDateString()
        $TimeToExpire = $EprireDate - (Get-Date)        
        $Days = $TimeToExpire.Days;
        if ($Days -ge 30) {" $($CertToExport.Thumbprint) `n  Subject=$($CertToExport.Subject) `n   $($Days) days to expire $($EprireDate)" 
        }
        else {
            if ( $Days -ge 0 ) {
                Write-Host " $($CertToExport.Thumbprint) `n  Subject=$($CertToExport.Subject) `n   $($Days) days to expire $($EprireDate)" 
            }
            else {
                Write-Host " $($CertToExport.Thumbprint) `n  Subject=$($CertToExport.Subject) `n   $($Days) days to expire $($EprireDate)" 
            }         
        }
        Write-Host ""
        
    }
}

PrintExpires "cert:\LocalMachine\My"

#PrintExpires "cert:\LocalMachine\Root"