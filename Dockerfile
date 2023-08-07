FROM zabbix/zabbix-agent2:6.4.2-ubuntu

ENV DEBIAN_FRONTEND noninteractive
ENV LANGUAGE ru_RU.UTF-8
ENV LANG ru_RU.UTF-8
ENV LC_ALL ru_RU.UTF-8

USER root
RUN  apt update; \
     apt-get install -y --no-install-recommends ntp whois locales language-pack-ru; \
     mkdir /etc/zabbix/scripts; \
     chown -R zabbix. /etc/zabbix/zabbix_agentd.d /etc/zabbix/scripts; \
     locale-gen ru_RU.UTF-8 && dpkg-reconfigure locales
USER 1997
