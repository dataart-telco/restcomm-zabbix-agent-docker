#!/bin/bash

set -x

for i in $( set -o posix ; set | grep ^ZA_ | sort -rn ); do
    reg=$(echo ${i} | cut -d = -f1 | cut -c 4-)
    val=$(echo ${i} | cut -d = -f2)
    FIND_RESULT=`grep ^${reg} /etc/zabbix/zabbix_agentd.conf`
    if [[ -n "$FIND_RESULT" ]]; then
        sed -i "s|^${reg}=.*|${reg}=${val}|g" /etc/zabbix/zabbix_agentd.conf 
    else
        echo "# Auto generated: $i"
        echo "${reg}=${val}" >> /etc/zabbix/zabbix_agentd.conf
    fi
done
