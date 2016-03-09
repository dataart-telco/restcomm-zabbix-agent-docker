#!/bin/bash

docker rm -f restcomm-agent

docker run -d --name restcomm-agent \
-e MARATHON_HOST=192.168.122.207:8080 \
-e MESOS_MASTER_HOST=192.168.122.182:5050 \
-e ZA_Server=192.168.122.2 \
-e ZA_ServerActive=192.168.122.2:31151 \
-e ZA_HostMetadata=restcomm \
-e ZA_Hostname=restcomm_host \
-e ZA_ListenPort=11050 \
--net host \
restcomm-zabbix-agent

sleep 2

docker exec -it restcomm-agent less /var/log/zabbix/zabbix_agentd.log
