#!/bin/bash

read -rp "Enter the directory to be archived: " log_dir
echo "=================================================================="
read -rp "Enter the directory to store the archive files: " output_dir

current_date=$(date +'%Y%m%d')
current_time=$(date +'%H%M%S')
log_archive_name=logs_archive_"$current_date"_"$current_time".tar.gz

# sudo was added to access /var/log directory
sudo tar -cvzPf "$log_archive_name" "$log_dir"

sudo mv "$log_archive_name" "$output_dir"


echo "The Logs archive $log_archive_name has been created"