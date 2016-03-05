FROM datelco/zabbix-agent-docker

MAINTAINER gdubina@dataart.com

ADD files/restcomm-zabbix-module.so /opt/restcomm-agent/restcomm-zabbix-module.so

RUN echo -n "LoadModulePath=/opt/restcomm-agent" >> /etc/zabbix/zabbix_agentd.conf
RUN echo -n "LoadModule=restcomm-zabbix-module.so" >> /etc/zabbix/zabbix_agentd.conf

