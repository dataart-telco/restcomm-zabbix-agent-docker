#!/bin/bash

cat > zabbix-agent.ini <<EOL
[main]
marathonHost = $MARATHON_HOST
appId = restcomm
logLevel = INFO
[restcomm]
port = 8080
user = ACae6e420f425248d6a26948c17a9e2acf
pswd = 42d8aa7cde9c78c4757862d84620c335
maxCalls = 50
EOL

