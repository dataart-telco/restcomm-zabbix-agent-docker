#!/bin/bash

docker rm -f restcomm-agent

#-e ZA_ListenIP=192.168.177.70,127.0.0.1 \
#-e ZA_ListenPort=31050 \

docker run -d --name restcomm-agent \
-e MARATHON_HOST=192.168.176.214:8080 \
-e ZABBIX_SERVER=172.17.0.3,192.168.177.71,172.17.0.1 \
-e ZA_HostMetadata=restcomm \
-e ZA_Hostname=restcomm_host \
-e ZA_ListenPort=11050 \
-e ZA_ServerActive=192.168.177.70:31151 \
--net host \
restcomm-zabbix-agent-docker

docker exec -it restcomm-agent less /var/log/zabbix/zabbix_agentd.log
