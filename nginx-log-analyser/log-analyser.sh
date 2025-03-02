#!/bin/bash

print_empty_lines() {
    for ((i=0; i<$1; i++)); do
        echo
    done
}

print_header () {
    echo "============================================="
    echo "$1"
    echo "============================================="
}

filename="nginx_access.log"

print_header "Top 5 IP addresses with the most requests"
top_5_ip=$(cat $filename | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}')
echo "$top_5_ip"

print_empty_lines 2

print_header "Top 5 most requested paths"
top_5_paths=$(cat $filename | awk '{print $7}' | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}')
echo "$top_5_paths"

print_empty_lines 2

print_header "Top 5 response status codes"
top_5_response_code=$(cat $filename | grep -oE ' [1-5][0-9]{2} ' | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}')
echo "$top_5_response_code"

print_empty_lines 2

print_header "Top 5 user agents"
top_5_user_agents=$(cat $filename | awk -F'"' '{print $6}' | sort | uniq -c | sort -nr | awk '{for(i=2;i<=NF;i++) printf "%s ", $i; print "-",$1,"requests"}' | head -n 5)

echo "$top_5_user_agents"

print_empty_lines 2