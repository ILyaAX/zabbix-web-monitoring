FROM zabbix/zabbix-agent2:6.4.2-ubuntu

COPY zabbix_agentd.d/ssl.conf /etc/zabbix/zabbix_agentd.d/
RUN mkdir /etc/zabbix/scripts
USER root
RUN apt update; \
    apt-get install -y --no-install-recommends ntp whois; \
    chown -R zabbix. /etc/zabbix/zabbix_agentd.d
USER 1997
