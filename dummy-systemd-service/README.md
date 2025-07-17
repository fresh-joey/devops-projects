# Dummy Systemd Service

Create a long-running systemd service that logs to a file.\
The goal of this project is to get familiar with systemd; creating and enabling a service, checking the status, keeping an eye on the logs, starting and stopping the service, etc.

## Requirements

- Create a script called dummy.sh that keeps running forever and writes a message to the log file every 10 seconds simulating an application running in the background
- Create a systemd service dummy.service that should start the app automatically on boot and keep it running in the background. If the service fails for any reason, it should automatically restart.
- You should be able to start, stop, enable, disable, check the status of the service, and check the logs i.e. following commands should be available for the service:

## Steps

- Create a `dummy.sh` file and copy the content of the script into it
- Make the file executable

```console
chmod +x dummy.sh
```

- Create a systemd service `dummy.service`

```console
sudo nano /etc/systemd/systemt/dummy.service
```

- Enter the content below inside the file

```ini
[Unit]
Description=Dummy Systemd Service
After=network.target
 
[Service]
ExecStart=/path/to/the/script
User=root
Restart=always
RestartSec=3
KillMode=process
KillSignal=SIGTERM
TimeoutStopSec=5min
 
[Install]
WantedBy=multi-user.target
```

- Enable the service.

```console
sudo systemctl enable dummy 
```

- Start the service

```console
sudo systemctl start dummy
```

- The following commands should be available for the service

```console
# Interacting with the service
sudo systemctl start dummy
sudo systemctl stop dummy
sudo systemctl enable dummy
sudo systemctl disable dummy
sudo systemctl status dummy

# Check the logs
sudo journalctl -u dummy -f
```

- Check the log file, to verify that the script works as it should.

```console
sudo nano /var/log/dummy-service.log
```

Project URL: <https://roadmap.sh/projects/dummy-systemd-service>
