# Определить пути к файлам и имя Data Collector Set

# Замените на путь к вашему шаблону
$templatePath = "C:\Audit\Audit.xml"
# Замените на имя вашего Data Collector Set
$dcsName = "Audit"
# Путь к лог-файлу, который будет создан
$logPath = "C:\Audit\Result\Audit.blg"
# Путь к выходному CSV-файлу
$csvPath = "C:\Audit\Result\Audit.csv"

# Импорт шаблона
Write-Output "Импорт шаблона..."
logman import $dcsName -xml $templatePath

# Настроить путь для вывода лога
Write-Output "Настройка пути вывода для Data Collector Set..."
logman update $dcsName -o $logPath

# Запуск Data Collector Set
Write-Output "Запуск Data Collector Set..."
logman start $dcsName -ets

# Ожидание 24 часа (86400 секунд)
Write-Output "Ожидание 24 часа..."
Start-Sleep -Seconds 15

# Остановка Data Collector Set
Write-Output "Остановка Data Collector Set..."
logman stop $dcsName -ets

# Экспорт данных в CSV
Write-Output "Экспорт данных в CSV..."
relog $logPath -f CSV -o $csvPath

Write-Output "Готово. Данные экспортированы в CSV: $csvPath"