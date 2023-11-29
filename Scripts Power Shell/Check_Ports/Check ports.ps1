$Ports  = "135","389","636","3268","53","88","445","3269", "80", "443"
$AllHosts = Get-Content C:\Scripts\list_servers.txt
ForEach($Hosts in $AllHosts)
{
    $Hosts
    Foreach ($P in $Ports){
        $check=Test-NetConnection $Hosts -Port $P -WarningAction SilentlyContinue
        If ($check.tcpTestSucceeded -eq $true)
            {Write-Host $Hosts.name $P -ForegroundColor Green -Separator " => "}
        else
            {Write-Host $Hosts.name $P -Separator " => " -ForegroundColor Red}
    }
}