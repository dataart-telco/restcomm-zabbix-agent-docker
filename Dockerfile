FROM datelco/zabbix-agent-docker

MAINTAINER gdubina@dataart.com

ADD files/restcomm-zabbix-module.so /opt/restcomm-agent/restcomm-zabbix-module.so

RUN echo "LoadModulePath=/opt/restcomm-agent" >> /etc/zabbix/zabbix_agentd.conf
RUN echo "LoadModule=restcomm-zabbix-module.so" >> /etc/zabbix/zabbix_agentd.conf

ADD files/za_config.sh /etc/my_init.d/za_config.sh
ADD files/configure.sh /etc/my_init.d/0_configure_module.sh
