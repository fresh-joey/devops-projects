#!/bin/bash

#This script is to add load to the system for testing purposes.
#It will run a simple loop that will consume CPU resources.

# Function to run a CPU-intensive task
run_cpu_intensive_task() {
    echo "Starting CPU-intensive task..."
    # Run a loop that consumes CPU resources
    while true; do
        # Perform a simple calculation to keep the CPU busy
        echo "Calculating..."
        for i in {1..1000000}; do
            echo $((i * i)) > /dev/null
        done
        sleep 1  # Sleep for a second to avoid overwhelming the system
    done
}  
