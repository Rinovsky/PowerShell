# Search recovery key on OS drive
if (test-path "$OSDrive\temp\$($env:computername)_BitlockerRecoveryPassword.txt") {
    # Remove recovery key
    try {
        Remove-Item "$OSDrive\temp\$($env:computername)_BitlockerRecoveryPassword.txt" -force -ErrorAction Stop
        Write-Output "File has been removed, system is ok"
        
    }
    catch {
        
        Write-Output "File has not been removed, system error `n $_"
    }
}
else {
    # Write result to output
    Write-Output "File not found, system is ok"
}