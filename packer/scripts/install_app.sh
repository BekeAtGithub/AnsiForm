#!/bin/bash
# Update package lists
sudo apt-get update -y

# Install Python and pip
sudo apt-get install -y python3 python3-pip

# Install Uvicorn and any required dependencies
pip3 install uvicorn fastapi

# Add application files (assuming they will be copied into the image or pulled from a repository)
mkdir -p /opt/uvicorn_app
# Example: You can add a Git clone command here if pulling the app from a repository
# git clone <repository_url> /opt/uvicorn_app

# Set up a systemd service for the Uvicorn app (if needed)
cat <<EOF | sudo tee /etc/systemd/system/uvicorn.service
[Unit]
Description=Uvicorn Web App
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/opt/uvicorn_app
ExecStart=/usr/local/bin/uvicorn main:app --host 0.0.0.0 --port 8000
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Enable and start the Uvicorn service
sudo systemctl enable uvicorn
sudo systemctl start uvicorn
