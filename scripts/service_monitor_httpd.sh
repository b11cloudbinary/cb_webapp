#!/bin/bash

# Define the name of the service you want to monitor
SERVICE_NAME="httpd"

# Function to check if the service is running
check_service_status() {
    if systemctl is-active --quiet $SERVICE_NAME; then
        echo "$SERVICE_NAME is running."
        return 0  # Service is running
    else
        echo "$SERVICE_NAME is not running."
        return 1  # Service is not running
    fi
}

# Function to start the service
start_service() {
    systemctl start $SERVICE_NAME
    echo "Starting $SERVICE_NAME..."
}

# Function to stop the service
stop_service() {
    systemctl stop $SERVICE_NAME
    echo "Stopping $SERVICE_NAME..."
}

# Main script logic
while true; do
    if ! check_service_status; then
        start_service
    fi

    # Sleep for a while before checking again (e.g., every 60 seconds)
    sleep 60
done
