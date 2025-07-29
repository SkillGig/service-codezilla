#!/bin/bash

# This script automates the setup and startup of the Codezilla service.
# Run this script from the root of your project directory on the EC2 instance.

echo "--- [1/5] Updating package manager ---"
sudo apt-get update -y

echo "--- [2/5] Installing Node.js, npm, Ruby, and Bundler ---"
sudo apt-get install -y nodejs npm ruby-full build-essential
sudo gem install bundler

echo "--- [3/5] Installing PM2 ---"
sudo npm install pm2 -g

echo "--- [4/5] Installing application dependencies ---"
bundle install

echo "--- [5/5] Starting application with PM2 ---"
# Make sure to update the 'cwd' path in ecosystem.config.js if your project is not in /srv/app
pm2 start ecosystem.config.js

echo "--- Setup and startup complete! ---"
echo "Use 'pm2 list' to check the status and 'pm2 logs' to see the logs."
