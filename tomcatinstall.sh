#!/bin/bash 
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1 
sudo su -- 
hostname ansible-controlnode 
amazon-linux-extras install -y ansible2 
useradd ansadmin 
passwd ansadmin
