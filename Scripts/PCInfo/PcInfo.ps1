#имя файла для записи информации
$fname = "pcinfo.txt"
$CPU = Get-WmiObject  -Class win32_processor
$MB = Get-WmiObject  -Class win32_baseboard
$MEM = Get-WmiObject Win32_PhysicalMemory
$DD = Get-PhysicalDisk
$pcn = Get-WmiObject -Class Win32_ComputerSystem

#имя компьютера
"pcname:	"+$pcn.Name | Out-File -FilePath $fname -Append -Encoding Default
#IP-адрес компьютера по его имени
Get-WmiObject Win32_NetworkAdapter -Filter 'NetConnectionStatus=2' |
ForEach-Object {
$pcip = 1 | Select-Object IP
$config = $_.GetRelated('Win32_NetworkAdapterConfiguration') 
$pcip.IP = $config | Select-Object -expand IPAddress
$pcip
}
foreach($aip in $pcip) {
"IP:	"+$aip.IP | Out-File -FilePath $fname -Append -Encoding Default
}
#имя активного пользователя
"username:	"+$pcn.PrimaryOwnerName | Out-File -FilePath $fname -Append -Encoding Default
#модель ноутбука
"CS Model:	"+$pcn.Model | Out-File -FilePath $fname -Append -Encoding Default
#процессор
$num = 0
foreach($processor in $CPU) {
$num = $num+1
"CPU "+$num+":	"+$processor.Name | Out-File -FilePath $fname -Append -Encoding Default
}
#материнская плата
"MB:	"+$MB.Product | Out-File -FilePath $fname -Append -Encoding Default
#оперативная память
$num = 0
foreach($memory in $MEM) {
$num = $num+1
"MEMORY "+$num+":	"+$memory.PartNumber+"	"+$memory.Capacity+"	"+$memory.Speed | Out-File -FilePath $fname -Append -Encoding Default
}
#диски
$num = 0
foreach($disk in $DD) {
$num = $num+1
"DISK "+$num+":	"+$disk.FriendlyName+"	"+$disk.Size+"	"+$disk.MediaType | Out-File -FilePath $fname -Append -Encoding Default
}