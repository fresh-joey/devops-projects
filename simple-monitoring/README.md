# Simple Monitoring Dashboard

## Requirements

In this project, you will set up a basic monitoring dashboard using Netdata. Netdata is a powerful, real-time performance and health monitoring tool for systems and applications.

- Install Netdata on a Linux system.
- Configure Netdata to monitor basic system metrics such as CPU, memory usage, and disk I/O.
- Access the Netdata dashboard through a web browser.
- Customize at least one aspect of the dashboard (e.g., add a new chart or modify an existing one).
- Set up an alert for a specific metric (e.g., CPU usage above 80%).

## Installation and setup

- To install Netdata, run the `setup.sh` file
- After the installation is complete, open your browser and access the Netdata dashboard via:
<http://localhost:19999> (or <http://NODE:19999> if remote)

## Load CPU and RAM

- Run the script the `test_dashboard.sh` script to load the system and then see the logs on the Netdata dashboard.

## Steup Alerts

- On the Netdada dashboard, configure alerts for when the CPU usage has exceeded 80% for more than 10secs.
- Also configure the medium to get the alert, you can use email.

## Cleanup

- When you're done testing the different functions of Netdata monitoring tool, run the `cleanup.sh` script to remove Netdata from the server.

`NOTE`: Always rememeber to run `chmod +x` for all the scripts before executing them
