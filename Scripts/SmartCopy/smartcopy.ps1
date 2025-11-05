# === Настройки ===
$source = "C:\Git\Obsidian"       # Исходная папка
$destination = "C:\Users\Rinov\iCloudDrive\iCloud~md~obsidian"  # Целевая папка
$logFile = "C:\tmp\backup_log.txt"  # Лог-файл

# === Проверки ===
if (-not (Test-Path -Path $source)) {
    Write-Host "❌ Исходная папка не найдена: $source"
    exit 1
}

# Создаём папку назначения, если её нет
if (-not (Test-Path -Path $destination)) {
    New-Item -ItemType Directory -Path $destination | Out-Null
}

# === Копирование ===
# Используем Robocopy — встроенную в Windows утилиту, которая умеет копировать
# только изменённые файлы и при этом очень надёжна.
# /MIR — зеркалирует структуру (удаляет файлы, которых больше нет в source)
# /MT — многопоточное копирование (быстрее)
# /R:2 /W:5 — ограничивает количество повторных попыток
# /NP /NFL /NDL — убирает лишний шум из вывода

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Add-Content $logFile "`n$timestamp — Backup started from $source to $destination"

$cmd = @(
    'robocopy',
    "`"$source`"",
    "`"$destination`"",
    '/MIR', '/MT:8', '/R:2', '/W:5', '/NP', '/NFL', '/NDL'
) -join ' '

# Выполняем Robocopy и записываем результат в лог
Invoke-Expression $cmd | Out-File -FilePath $logFile -Append -Encoding utf8

Add-Content $logFile "$timestamp — ✅ Backup completed successfully."