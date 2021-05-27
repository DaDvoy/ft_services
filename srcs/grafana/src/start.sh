#!/bin/sh

/etc/telegraf/usr/bin/telegraf &
cd /grafana/bin && ./grafana-server