#!/bin/sh

zabbix_sender -v --config /etc/zabbix/zabbix_agentd.conf --key "restic.prune.exitcode" --value "$?"

LOG_PROCESSED_B=$( python3 -c 'import re;f = open("/opt/suporteajato/log/latest-prune.log", "r");text = f.read();regex=r"(?<=\/)(.*?)(?=G)";string = re.compile(regex);match = string.search(text);print(match.group(1));f.close()'
zabbix_sender --config /etc/zabbix/zabbix_agentd.conf --key "restic.prune.remaining" --value "$LOG_PROCESSED_B"

LOG_PRUNE=$( python3 -c 'with open("/opt/suporteajato/log/latest-prune.log", "r") as f:lines = f.read().splitlines();last_line = lines[3:];print(last_line)' )
zabbix_sender --config /etc/zabbix/zabbix_agentd.conf \
	--key "restic.prune.message" --value "$LOG_PRUNE"
