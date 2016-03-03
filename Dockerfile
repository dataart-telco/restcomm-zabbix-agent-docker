FROM datelco/zabbix-agent-docker

MAINTAINER gdubina@dataart.com

ADD files/restcomm-metrics /opt/restcomm-agent/restcomm-metrics

RUN echo -n "UserParameter=restcomm.supervisor.metrics[*],/opt/restcomm-agent/restcomm-metrics $1" >> /etc/zabbix/zabbix_agentd.conf

