# PowerShell-скрипт для установки Microsoft Office 2024 LTSC
$odtPath = "C:\ODT"
$setupExe = Join-Path $odtPath "setup.exe"
$configXml = Join-Path $odtPath "conf.xml"

if (!(Test-Path $setupExe)) {
    Write-Error "❌ setup.exe не найден в $odtPath. Скачай Office Deployment Tool с сайта Microsoft."
    exit 1
}

if (!(Test-Path $configXml)) {
    Write-Error "❌ configuration.xml не найден в $odtPath. Убедись, что файл существует."
    exit 1
}

Write-Host "🚀 Начинается установка Microsoft Office 2024 LTSC..." -ForegroundColor Cyan
Start-Process -FilePath $setupExe -ArgumentList "/configure `"$configXml`"" -Wait

Write-Host "✅ Установка завершена." -ForegroundColor Green