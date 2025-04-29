#!/bin/bash

CONTAINER_NAME="zomato"
IMAGE_NAME="saif764/zomato:latest"
PORT_MAPPING="3000:3000"

if docker ps --format '{{.Names}}' | grep -w "$CONTAINER_NAME" > /dev/null; then
    echo "Container '$CONTAINER_NAME' is running."
    echo "Stopping and removing it for update..."
    docker stop "$CONTAINER_NAME"
    docker rm "$CONTAINER_NAME"
elif docker ps -a --format '{{.Names}}' | grep -w "$CONTAINER_NAME" > /dev/null; then
    echo "Container '$CONTAINER_NAME' exists but is not running."
    echo "Removing it before starting new one..."
    docker rm "$CONTAINER_NAME"
else
    echo "Container '$CONTAINER_NAME' does not exist."
fi

echo "Starting fresh container..."
docker run -d --name "$CONTAINER_NAME" -p "$PORT_MAPPING" "$IMAGE_NAME"
