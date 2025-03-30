#!/bin/bash

# Variables
LOCAL_DIR="/home/josephemmanuel/Documents/Devops/devops-projects/static-site-server"
REMOTE_USER="ubuntu"
REMOTE_HOST="54.209.176.20"
REMOTE_DIR="/var/www/web"
SSH_KEY="/home/josephemmanuel/Downloads/web-key.pem"

# Rsync command
echo "==========================="
echo "Syncing files..."
echo "==========================="

rsync -avz -e "ssh -i $SSH_KEY" --delete $LOCAL_DIR/ $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR

# Change file permission after sync
echo "==========================="
echo "Updating file permissions..."
echo "==========================="
ssh -i "$SSH_KEY" "$REMOTE_USER@$REMOTE_HOST" "sudo chown -R ubuntu:www-data $REMOTE_DIR && sudo chmod -R 755 $REMOTE_DIR" 

# Print a message
echo "Deployment complete!"