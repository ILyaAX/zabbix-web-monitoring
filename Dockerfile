FROM zabbix/zabbix-agent2:6.4.2-ubuntu

USER root
RUN  apt update; \
     apt-get install -y --no-install-recommends ntp whois; \
     mkdir /etc/zabbix/scripts; \
     chown -R zabbix. /etc/zabbix/zabbix_agentd.d /etc/zabbix/scripts
USER 1997
