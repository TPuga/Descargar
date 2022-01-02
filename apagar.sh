#!/bin/bash

# Puedes definir un crontab:
# */1 * * * *     /root/bin/apagar.sh

TIMELIMIT=1   # Equivale a 120 minutos.
CUR_DIR=$( dirname $( readlink -e "$0" ))
TIMECURRENT=$CUR_DIR/log/$( date +%Y.%m.%d ).log
echo "1" >> $TIMECURRENT
ALLTIME=$( wc -l $TIMECURRENT | cut -d" " -f1 )
[[ "$ALLTIME" -ge "$TIMELIMIT" ]] && /sbin/shutdown -h now
