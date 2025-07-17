#!/bin/bash

sudo rm -rf /tmp/netdata-kickstart.sh

sudo systemctl stop netdata
sudo systemctl disable netdata

sudo apt-get remove --purge netdata -y

sudo apt-get autoremove -y