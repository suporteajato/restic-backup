#!/bin/sh

/opt/suporteajato/bin/resticprofile -c /opt/suporteajato/etc/profiles.conf check > /opt/suporteajato/log/latest-check.log

/opt/suporteajato/bin/log-check.sh
