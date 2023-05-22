#!/bin/sh

/opt/suporteajato/bin/resticprofile -c /opt/suporteajato/etc/profiles.conf backup

/opt/suporteajato/bin/log-backup.sh

/opt/suporteajato/bin/prune.sh

/opt/suporteajato/bin/check.sh
