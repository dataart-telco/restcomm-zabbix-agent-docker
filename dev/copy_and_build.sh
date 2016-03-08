#!/bin/bash

mv ~/work/go/src/restcomm-zabbix-module/restcomm-zabbix-module.so files/
docker build -t restcomm-zabbix-agent .
docker rm -f restcomm-agent
docker run -d --name=restcomm-agent -e MARATHON_HOST=192.168.122.207:8080 -e ZABBIX_SERVER=192.168.122.2 --net=host restcomm-zabbix-agent
