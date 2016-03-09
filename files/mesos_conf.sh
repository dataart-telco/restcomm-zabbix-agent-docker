#!/bin/bash

if [[ -z "$APP_ID" ]]; then
    APP_ID=restcomm
fi

if [[ -z "$LOG_LEVEL" ]]; then
    LOG_LEVEL=INFO
fi

if [[ -z "$MESOS_MASTER_HOST" ]]; then
    MESOS_MASTER_HOST=127.0.0.1:5050
fi

if [[ -z "$COLLECTOR_INTERVAL" ]]; then
    COLLECTOR_INTERVAL=10
fi

cat > master-zabbix-agent.ini <<EOL
[main]
logLevel = $LOG_LEVEL
collectorInterval = $COLLECTOR_INTERVAL
[mesos]
host = $MESOS_MASTER_HOST
EOL

