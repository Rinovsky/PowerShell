Get-Content -Path "C:\Scripts\RemoveDns\servers.txt" | foreach {
    Get-DnsServerResourceRecord -ZoneName #'Domain_name' -Name $_  -ComputerName 'computer_name' | Remove-DnsServerResourceRecord -ZoneName 'Domaun_name'  -ComputerName 'computer_name' #-Force
    }