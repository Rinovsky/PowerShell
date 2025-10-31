# Путь к исходной папке
$source = "C:\Git\Obsidian"

# Путь к целевой папке
$destination = "C:\Users\Rinov\iCloudDrive\Obsidian"

# Удаляем целевую папку целиком, если она существует
if (Test-Path -Path $destination) {
    Remove-Item -Path $destination -Recurse -Force
}

# Создаём целевую папку, если её нет
if (-not (Test-Path -Path $destination)) {
    New-Item -ItemType Directory -Path $destination
}

# Копируем содержимое (все подпапки и файлы)
Copy-Item -Path "$source\*" -Destination $destination -Recurse -Force

# Можно добавить запись в лог
$logFile = "C:\tmp\backup_log.txt"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
"$timestamp - Backup completed from $source to $destination" | Out-File -FilePath $logFile -Append