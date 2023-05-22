#!/bin/sh

/opt/suporteajato/bin/resticprofile -c /opt/suporteajato/etc/profiles.conf forget --keep-daily 7 > /opt/suporteajato/log/latest-forget.log

/opt/suporteajato/bin/resticprofile -c /opt/suporteajato/etc/profiles.conf prune > /opt/suporteajato/log/latest-prune.log

/opt/suporteajato/bin/log-prune.sh
