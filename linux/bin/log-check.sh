#!/bin/sh

zabbix_sender -v --config /etc/zabbix/zabbix_agentd.conf --key "restic.check.exitcode" --value "$?"

LOG_CHECK=$( python3 -c 'with open("/opt/suporteajato/log/latest-check.log", "r") as f:lines = f.read().splitlines();last_line = lines[3:];print(last_line)' )
zabbix_sender --config /etc/zabbix/zabbix_agentd.conf \
	--key "restic.check.message" --value "$LOG_CHECK"
