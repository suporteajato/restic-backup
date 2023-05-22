#!/bin/sh

zabbix_sender -v --config /etc/zabbix/zabbix_agentd.conf --key "restic.backup.exitcode" --value "$?"

LOG_ADDED=$( python3 -c 'f = open("/opt/suporteajato/log/backup-status.json", "r");text = f.read();print(text);f.close()' | \
	        python3 -c 'import json,sys;print(json.load(sys.stdin)["profiles"]["default"]["backup"]["files_total"])')
zabbix_sender --config /etc/zabbix/zabbix_agentd.conf --key "restic.backup.added" --value "$LOG_ADDED"

LOG_PROCESSED_D=$( python3 -c 'f = open("/opt/suporteajato/log/backup-status.json", "r");text = f.read();print(text);f.close()' | \
	        python3 -c 'import json,sys;print(json.load(sys.stdin)["profiles"]["default"]["backup"]["duration"])')
zabbix_sender --config /etc/zabbix/zabbix_agentd.conf --key "restic.backup.duration" --value "$LOG_PROCESSED_D"

LOG_PROCESSED_B=$( python3 -c 'f = open("/opt/suporteajato/log/backup-status.json", "r");text = f.read();print(text);f.close()' | \
	        python3 -c 'import json,sys;print(json.load(sys.stdin)["profiles"]["default"]["backup"]["bytes_total"])')
zabbix_sender --config /etc/zabbix/zabbix_agentd.conf --key "restic.backup.pbytes" --value "$LOG_PROCESSED_B"
