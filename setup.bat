@echo off
cd /d "%USERPROFILE%\DEV\YTB-FLASK-SERVEUR"

:: Créer le venv s'il n'existe pas
if not exist myenv (
    python -m venv myenv
)

:: Activer le venv
call myenv\Scripts\activate.bat

:: Installer les dépendances
pip install -r requirements.txt

:: Lancer le serveur Flask
python serveur.py
