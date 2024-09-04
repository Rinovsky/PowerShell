#Иморт темплейта и запуска PerfMonitor на 24 часа

# Путь к шаблону
$templatePath = "C:\Audit\Audit.xml"
# Имя Data Collector Set  
$dcsName = "Audit"
# Путь к лог-файлу, который будет создан       
$logPath = "C:\Audit\Result\Audit.csv"
# Путь к CSV-файлу       
$csvPath = "C:\Audit\Result\Audit.csv"        

# Импорт шаблона
Write-Output "Импорт шаблона..."
logman import $dcsName -xml $templatePath

# Настроить путь для вывода лога
Write-Output "Настройка пути вывода для Data Collector Set..."
logman update $dcsName -o $logPath

# Запуск Data Collector Set
Write-Output "Запуск Data Collector Set..."
logman start $dcsName

# Ожидание 15 секунд 
Write-Output "Ожидание 15 секунд..."
Start-Sleep -Seconds 15

# Экспорт ветки реестра

# Путь к ветке реестра
$registryPath = "HKLM\SOFTWARE\Microsoft\Azure\StorageSync"  
# Путь к выходному файлу
$outputPath = "C:\Audit\Result\AFS.reg"

# Экспорт ветки реестра в файл
Write-Output "Экспорт ветки реестра..."
reg export $registryPath $outputPath /y

# Ожидание 15 секунд 
Write-Output "Ожидание 15 секунд..."
Start-Sleep -Seconds 15

#Экспорт журналов

# Определим переменные
$logName1 = "Microsoft-FileSync-Agent/Diagnostic"  
$logName2 = "Microsoft-FileSync-Agent/ItemResults" 
$logName3 = "Microsoft-FileSync-Agent/Operational" 
$logName4 = "Microsoft-FileSync-Agent/RecallResults" 
$logName5 = "Microsoft-FileSync-Agent/Scrubbing" 
$logName6 = "Microsoft-FileSync-Agent/Telemetry" 
$logName7 = "Microsoft-FileSync-Agent/TieringResults"
$logName8 = "Application"
$logName9 = "System"
$logName10 = "Microsoft-FileSync-Management/Diagnostic"
$logName11 = "Microsoft-FileSync-Management/Operational"

$outputPath1 = "C:\Audit\Result\AFS_Diagnostic.csv" 
$outputPath2 = "C:\Audit\Result\AFS_ItemResults.csv" 
$outputPath3 = "C:\Audit\Result\AFS_Operational.csv" 
$outputPath4 = "C:\Audit\Result\AFS_RecallResults.csv" 
$outputPath5 = "C:\Audit\Result\AFS_Scrubbing.csv" 
$outputPath6 = "C:\Audit\Result\AFS_Telemetry.csv"
$outputPath7 = "C:\Audit\Result\AFS_TieringResults.csv"
$outputPath8 = "C:\Audit\Result\Application.csv"
$outputPath9 = "C:\Audit\Result\System.csv"
$outputPath10 = "C:\Audit\Result\AFS_ManDiagnostic.csv"
$outputPath11 = "C:\Audit\Result\AFS_ManOperational.csv"

# Получить события журнала
Write-Output "Получение журналов..."

$events1 = Get-WinEvent -LogName $logName1 -ErrorAction SilentlyContinue
$events2 = Get-WinEvent -LogName $logName2 -ErrorAction SilentlyContinue
$events3 = Get-WinEvent -LogName $logName3 -ErrorAction SilentlyContinue
$events4 = Get-WinEvent -LogName $logName4 -ErrorAction SilentlyContinue
$events5 = Get-WinEvent -LogName $logName5 -ErrorAction SilentlyContinue
$events6 = Get-WinEvent -LogName $logName6 -ErrorAction SilentlyContinue
$events7 = Get-WinEvent -LogName $logName7 -ErrorAction SilentlyContinue
$events8 = Get-WinEvent -LogName $logName8 -ErrorAction SilentlyContinue
$events9 = Get-WinEvent -LogName $logName9 -ErrorAction SilentlyContinue
$events10 = Get-WinEvent -LogName $logName10 -ErrorAction SilentlyContinue
$events11 = Get-WinEvent -LogName $logName11 -ErrorAction SilentlyContinue

# Ожидание 15 секунд 
Write-Output "Ожидание 15 секунд..."
Start-Sleep -Seconds 15

# Экспорт данных в CSV
Write-Output "Экспорт журналов в CSV..."
$events1 | Export-Csv -Path $outputPath1 -NoTypeInformation
$events2 | Export-Csv -Path $outputPath2 -NoTypeInformation
$events3 | Export-Csv -Path $outputPath3 -NoTypeInformation
$events4 | Export-Csv -Path $outputPath4 -NoTypeInformation
$events5 | Export-Csv -Path $outputPath5 -NoTypeInformation
$events6 | Export-Csv -Path $outputPath6 -NoTypeInformation
$events7 | Export-Csv -Path $outputPath7 -NoTypeInformation
$events8 | Export-Csv -Path $outputPath8 -NoTypeInformation
$events9 | Export-Csv -Path $outputPath9 -NoTypeInformation
$events10 | Export-Csv -Path $outputPath10 -NoTypeInformation
$events11 | Export-Csv -Path $outputPath11 -NoTypeInformation

Write-Output "Готово. Файлы экспортированы в CSV"