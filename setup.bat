@echo off
setlocal

REM Aller dans le dossier du script
cd /d "%~dp0"

REM Créer le venv si nécessaire
if not exist myenv (
    python -m venv myenv
)

REM Activer le venv
call myenv\Scripts\activate.bat

REM Installer les dépendances
pip install -r requirements.txt

REM Créer le fichier .bat de lancement automatique
set "LAUNCHER=%~dp0launch_server.bat"
echo @echo off > "%LAUNCHER%"
echo cd /d "%~dp0" >> "%LAUNCHER%"
echo call myenv\Scripts\activate.bat >> "%LAUNCHER%"
echo python serveur.py >> "%LAUNCHER%"

REM Créer la tâche planifiée (Windows)
echo.
echo Creating scheduled task to run Flask server at login...

schtasks /Create ^
 /TN "YT-Flask-Server" ^
 /TR "\"%LAUNCHER%\"" ^
 /SC ONLOGON ^
 /RL HIGHEST ^
 /F

REM Lancer la tâche immédiatement
echo.
echo Launching the Flask server task now...
schtasks /Run /TN "YT-Flask-Server"

echo.
echo ✅ Setup complete! The server is now running and will launch automatically at login.
pause
