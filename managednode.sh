#!/bin/bash 
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1 
sudo su -- 
hostname ansible-managednode 
useradd ansadmin 
passwd ansadmin