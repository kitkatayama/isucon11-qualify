#!/bin/bash
set -ex

. /home/isucon/.bash_profile
/home/isucon/env.sh

#------------
# APP server
#------------

if [ `uname -n` = "ip-192-168-0-11" ] || [ `uname -n` = "ip-192-168-0-12" ]; then 

## stop services

#sudo systemctl stop mysql
sudo systemctl stop nginx
sudo systemctl stop isucondition.go.service
sleep 1

## language specific build code here
cd ~/webapp/go && make

## log rotate
sudo cp /var/log/nginx/access.log /var/log/nginx/access.log-`date "+%s"`
sudo truncate --size 0 /var/log/nginx/access.log

## start service

# sudo systemctl start mysql
sleep 1
sudo systemctl start isucondition.go.service
sudo systemctl start nginx

fi

#------------
# DB server
#------------

if [ `uname -n` = "ip-192-168-0-13" ] ; then 

/home/isucon/webapp/sql/init.sh
sleep 1
fi
