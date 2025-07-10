#!/bin/bash

# Variables
LOCAL_DIR="project/website"
REMOTE_USER="ubuntu"
REMOTE_HOST="server-ip"
REMOTE_DIR="/var/www/website"
SSH_KEY="/path/to/web-key.pem"

# Rsync command
echo "---------------------------"
echo "Syncing files..."
echo "---------------------------"

rsync -avz --progress -e "ssh -i $SSH_KEY" --delete $LOCAL_DIR/ $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR

# Change file permission after sync
echo "---------------------------"
echo "Updating file permissions..."
echo "---------------------------"
ssh -i "$SSH_KEY" "$REMOTE_USER@$REMOTE_HOST" "sudo chown -R ubuntu:www-data $REMOTE_DIR && sudo chmod -R 755 $REMOTE_DIR" 

# Print a message
echo "Deployment complete!"