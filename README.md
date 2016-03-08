# restcomm-zabbix-agent-docker

Zabbix agent for **Restcomm Cluster**

It collects restcomm metrics from all restcomm nodes(tasks) in mesos cluster. 
It uses `shared object modules` intead of `UserParameter`.

### Discovery
You should use LLD with `restcomm.discovery` key

Discovery result contains the followings keys

1. {#APP_NAME} - cluster app name. `restcomm` by default
2. {#INSTANCE_ID} - restocmm node Instance id

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
