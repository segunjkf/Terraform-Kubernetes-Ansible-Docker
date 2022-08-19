#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
sudo yum update -y && sudo yum install -y docker
sudo systemctl start docker 
sudo systemcrl enable docker
sudo usermod -aG docker ec2-user
docker run -p 8080:80 nginx


