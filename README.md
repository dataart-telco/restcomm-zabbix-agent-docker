# restcomm-zabbix-agent-docker

Zabbix agent for **Restcomm Cluster**

It collects restcomm metrics from all restcomm nodes(tasks) in mesos cluster. 
It uses `shared object modules` intead of `UserParameter`.

## Docker env variables

1. `MARATHON_HOST` - mesos marathon host like `127.0.0.1:8080`
2. `ZA_agent_conf_key` - you can use this template to override/add any zabbix agent config field 

### Run 

You should use `--net host` otherwise zabbix agent will send internal docker container ip address to zabbix server
``` shell
docker run -d \
--name restcomm-agent \
-e MARATHON_HOST=192.168.176.214:8080 \
-e ZA_Server=192.168.177.70 \
-e ZA_ServerActive=192.168.177.70:31151 \
-e ZA_HostMetadata=restcomm \
-e ZA_Hostname=restcomm \
-e ZA_ListenPort=11050 \
--net host \
datelco/restcomm-zabbix-agent
```
---
## How to use app

### Discovery
You should use LLD with `restcomm.discovery` key

Discovery result contains the followings keys

1. `{#APP_NAME}` - cluster app name. `restcomm` by default
2. `{#INSTANCE_ID}` - restocmm node Instance id

### Available metrics:
metrics template is `restcomm.metrics[{#INSTANCE_ID},<Metric Key>]`

Metric Keys:

1. LiveCalls
2. TotalCallsSinceUptime
3. FailedCalls
4. CompletedCalls
5. LiveOutgoingCalls
6. LiveIncomingCalls

Module source code - https://github.com/dataart-telco/restcomm-zabbix-module 
