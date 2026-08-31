#!/bin/bash

sudo dnf update -y

sudo dnf install -y \
  git \
  wget \
  httpd \
sudo systemctl start httpd
sudo systemctl enable httpd
sudo groupadd Cloud
sudo adduser Ohene 
echo "Packages installed successfully!"