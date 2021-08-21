#!/bin/bash
set -ex

## stop services

#sudo systemctl stop mysql
sudo systemctl stop nginx
sudo systemctl disable --now isucondition.go.service
sleep 1

## language specific build code here
cd ~/webapp/go && make

## log rotate
sudo cp /var/log/nginx/access.log /var/log/nginx/access.log-`date "+%s"`
sudo truncate --size 0 /var/log/nginx/access.log

## start service

# sudo systemctl start mysql
sleep 1
sudo systemctl start --now isucondition.go.service
sudo systemctl start nginx

## initialize code here
~isucon/webapp/sql/init.sh
sleep 1
