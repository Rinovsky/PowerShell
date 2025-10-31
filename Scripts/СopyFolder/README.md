2️⃣ Настройка запуска по расписанию через Task Scheduler

Открой Task Scheduler (Планировщик заданий Windows).

Создать задачу → дайте имя, например FolderBackupReplace.

Вкладка Triggers → New... → настройте расписание (ежедневно, ежечасно и т.д.).

Вкладка Actions → New...:

Action: Start a program

Program/script:

powershell.exe


Add arguments:

-ExecutionPolicy Bypass -File "C:\Git\PowerShell\Scripts\СopyFolder\CopyFolderReplace.ps1"


Опционально: во вкладке Conditions и Settings можно снять галочки про AC power и включить “Run task as soon as possible after a missed start”.