#!/bin/bash

if [[ -z "$APP_ID" ]]; then
    APP_ID=restcomm
fi

if [[ -z "$LOG_LEVEL" ]]; then
    LOG_LEVEL=INFO
fi

if [[ -z "$RESTCOMM_PORT" ]]; then
    RESTCOMM_PORT=8080
fi

if [[ -z "$RESTCOMM_USER" ]]; then
    RESTCOMM_USER=ACae6e420f425248d6a26948c17a9e2acf
fi

if [[ -z "$RESTCOMM_PSWD" ]]; then
    RESTCOMM_PSWD=42d8aa7cde9c78c4757862d84620c335
fi

if [[ -z "$RESTCOMM_MAX_CALLS" ]]; then
    RESTCOMM_MAX_CALLS=50
fi

cat > zabbix-agent.ini <<EOL
[main]
marathonHost = $MARATHON_HOST
appId = $APP_ID
logLevel = $LOG_LEVEL
[restcomm]
port = $RESTCOMM_PORT
user = $RESTCOMM_USER
pswd = $RESTCOMM_PSWD
maxCalls = $RESTCOMM_MAX_CALLS
EOL

