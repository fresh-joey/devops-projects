#!/bin/bash

print_empty_lines() {
    for ((i=0; i<$1; i++)); do
        echo
    done
}

print_header () {
    echo "============================="
    echo "$1"
    echo "============================="
}


## Total CPU usage
print_header "Total CPU Usage"
cpu_usage=$(mpstat 1 1 | awk '/Average/ {print 100 - $NF}')
echo "Total CPU Usage: $cpu_usage%"
print_empty_lines 2

##Total memory usage (Free vs Used including percentage)
print_header "Total Memory Usage"
total_mem=$(free -m | awk '/^Mem/ {print $2}')
used_mem=$(free -m | awk '/^Mem/ {print $3}')
free_mem=$(free -m | awk '/^Mem/ {print $4 + $6 + $7}')
free_mem_gb=$(echo "scale=2; $free_mem / 1024" | bc)
free_mem_percent=$(echo "scale=2; ($free_mem / $total_mem) * 100" | bc)

echo "Total Memory: $total_mem "
echo "Used Memory: $used_mem"
echo "Free Memory: ${free_mem_gb}GB (${free_mem_percent}%)"

print_empty_lines 2


##Total disk usage (Free vs Used including percentage)
print_header "Total Disk Usage"
total_disk=$(df -h / | awk 'NR==2 {print $2}')
used_disk=$(df -h / | awk 'NR==2 {print $3}')
free_disk=$(df -h / | awk 'NR==2 {print $4}')
used_percent=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
free_percent=$(( 100 - $used_percent ))

echo "Total Disk Space: $total_disk"
echo "Used Disk Space: $used_disk (${used_percent}%)"
echo "Free Disk Space: $free_disk (${free_percent}%)"

print_empty_lines 2

##Top 5 processes by CPU usage
print_header "Top 5 Processes by CPU Usage"
ps -eo user,pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

print_empty_lines 2

##Top 5 processes by memory usage
print_header "Top 5 Processes by Memory Usage"
ps -eo user,pid,ppid,cmd,%mem --sort=-%mem | head -n 6

print_empty_lines 2

# Additional Stats
os_name=$(awk -F= 'NR==2 {print $2}' /etc/os-release | tr -d '"')
os_version=$(awk -F= 'NR==4 {print $2}' /etc/os-release | tr -d '"')
os_info="$os_name $os_version"
uptime=$(uptime -p | awk '{print $2,$3,$4,$5,$6,$7}' )

print_header "Some Additional Stats"
echo -e "Linux Environment: \n$os_info"
echo
echo -e "Uptime: \n$uptime"
echo
echo "Load Average: "
cat /proc/loadavg
echo
echo "Logged in users: "
who
