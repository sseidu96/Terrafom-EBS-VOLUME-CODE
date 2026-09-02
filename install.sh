#!/bin/bash

sudo yum update -y
sudo yum install -y git httpd wget unzip

sudo systemctl start httpd
sudo systemctl enable httpd

sudo groupadd DevOps
sudo useradd Serge

wget https://github.com/utrains/static-resume/archive/refs/heads/main.zip
unzip main.zip

sudo cp -r static-resume-main/* /var/www/html/

sudo systemctl restart httpd