@echo off
setlocal

:: Aller dans le dossier du script
cd /d "%~dp0"

:: Créer le venv si nécessaire
if not exist myenv (
    python -m venv myenv
)

:: Activer le venv
call myenv\Scripts\activate.bat

:: Installer les dépendances
pip install -r requirements.txt

:: Créer launch_server.bat
echo @echo off > launch_server.bat
echo cd /d "%%~dp0" >> launch_server.bat
echo call myenv\Scripts\activate.bat >> launch_server.bat
echo python serveur.py >> launch_server.bat

schtasks /Create ^
 /TN "YT-Flask-Server" ^
 /TR "powershell.exe -WindowStyle Hidden -Command \"Start-Process '%~dp0launch_server.bat' -WindowStyle Hidden\"" ^
 /SC ONLOGON ^
 /RL HIGHEST ^
 /F

:: Lancer la tâche maintenant
echo.
echo Launching the Flask server task now...
schtasks /Run /TN "YT-Flask-Server"

echo.
echo ✅ Setup complete! The server is running silently and will start at login.
pause
