#!/bin/bash

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y ufw fail2ban 

sudo ufw limit 22/tcp  
sudo ufw allow 80/tcp  
sudo ufw allow 443/tcp  
sudo ufw default deny incoming  
sudo ufw default allow outgoing
sudo ufw enable

sudo cp fail2ban.local /etc/fail2ban/jail.local
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
