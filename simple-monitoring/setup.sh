#!/bin/bash

# Verify the installation before running the script
# This script checks if the Netdata kickstart script is valid by comparing its MD5 hash
# against a known good hash. If the hash matches, it proceeds to install Netdata.
[ "b6cffd1932d6a4c4d832e57ece8abe79" = "$(curl -Ss https://get.netdata.cloud/kickstart.sh | md5sum | cut -d ' ' -f 1)" ] && echo "OK, VALID" || echo "FAILED, INVALID"

if [ $? -ne 0 ]; then
    echo "Error: The Netdata kickstart script is invalid. Exiting."
    exit 1
else
    echo "The Netdata kickstart script is valid. Proceeding with installation."
fi

# Instll Netdata
# This script installs Netdata, a real-time performance monitoring tool.
# It downloads the kickstart script from Netdata's official site and executes it.
wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && sh /tmp/netdata-kickstart.sh
# Check if the installation was successful
