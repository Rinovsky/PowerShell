@echo off
REM запускаем 64-bit PowerShell без профиля и с обходом ExecutionPolicy
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -NonInteractive -ExecutionPolicy Bypass -File "C:\Git\PowerShell\Scripts\SmartCopy\SmartCopy.ps1" >> "C:\tmp\SmartCopy_run.log" 2>&1
exit /b %ERRORLEVEL%