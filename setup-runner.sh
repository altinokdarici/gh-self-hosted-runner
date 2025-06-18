#!/bin/bash
NAME=$1
TOKEN=$2


mkdir -p ~/runners/$NAME
cd ~/runners/$NAME

curl -o actions-runner-linux-x64-2.325.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.325.0/actions-runner-linux-x64-2.325.0.tar.gz
tar xzf ./actions-runner-linux-x64-2.325.0.tar.gz

echo "Extracted actions runner to ~/runners/$NAME"

./config.sh --url https://github.com/altinokdarici/onchainsite.xyz --token $TOKEN --name altinok-dev0-$NAME --unattended
echo "Configured actions runner with name $NAME"

echo "Setting up the service..."
sudo ./svc.sh install
echo "Service installed successfully."

echo "Starting the service..."
sudo ./svc.sh start
echo "Service started successfully."
