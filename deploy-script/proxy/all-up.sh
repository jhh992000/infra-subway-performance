#!/bin/bash

sudo echo -e "server 192.168.100.157:8080;\nserver 192.168.100.157:8081;" > /etc/nginx/upstream.conf
sudo nginx -s reload