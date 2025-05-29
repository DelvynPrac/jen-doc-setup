#!/bin/bash

set -e
export PATH=$PATH:/usr/local/bin

# Change to workspace directory
cd "$WORKSPACE"

echo "Building Docker image..."
docker build -t apache-site-timeout .

echo "Stopping existing container if it exists..."
docker stop apache-temp || true
docker rm apache-temp || true

echo "Running container on port 8085..."
docker run -d --name apache-temp -p 8087:80 apache-site-timeout

#echo "Waiting 2 minutes before stopping the container..."
#sleep 120

#echo "Stopping container..."
#docker stop apache-temp
#docker rm apache-temp
echo "Listing files of $WORKSPACE"
ls -ltr
echo "Clearing workspace"
rm -rf * 
echo "Deployment finished."

