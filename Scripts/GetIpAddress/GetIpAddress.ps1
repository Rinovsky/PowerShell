#IP list of PC
Get-NetIPConfiguration | Select-Object InterfaceAlias, IPv4Address