#!/bin/bash

# Aller dans le dossier du script
cd "$(dirname "$0")"

APP_DIR="$(pwd)"
PYTHON_BIN="$APP_DIR/myenv/bin/python"
SERVICE_NAME="ytb-downloader.service"

# Créer le venv si nécessaire
if [ ! -d "myenv" ]; then
    python3 -m venv myenv
fi

# Activer le venv
source myenv/bin/activate

# Installer les dépendances
pip install -r requirements.txt

# Créer le service systemd
SERVICE_PATH="/etc/systemd/system/$SERVICE_NAME"

echo "Creating systemd service at $SERVICE_PATH..."

sudo bash -c "cat > $SERVICE_PATH" <<EOF
[Unit]
Description=YT Flask Downloader Server
After=network-online.target
Wants=network-online.target

[Service]
ExecStart=$PYTHON_BIN $APP_DIR/serveur.py
WorkingDirectory=$APP_DIR
Restart=always
User=$USER
Environment=PYTHONUNBUFFERED=1

[Install]
WantedBy=multi-user.target
EOF

# Recharger systemd, activer et démarrer le service
echo "Reloading systemd..."
sudo systemctl daemon-reload
sudo systemctl enable $SERVICE_NAME
sudo systemctl restart $SERVICE_NAME

echo "✅ Service '$SERVICE_NAME' is installed and running!"

