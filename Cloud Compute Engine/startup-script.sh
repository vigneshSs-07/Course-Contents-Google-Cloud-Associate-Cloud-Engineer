#!/bin/bash
apt update 
apt -y install apache2
echo "Hello world from $(hostname) $(hostname -I). Welcome to Cloud & AI Anlaytics" > /var/www/html/index.html