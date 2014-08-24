#!/bin/sh
codeBakName=fan_code_$(date +"%Y-%m-%d").tar.gz
dataBakName=fan_data_$(date +"%Y-%m-%d").tar.gz
/usr/bin/rsync -vzrtopgu -progress /root/workspace/fan16/t31/* /root/backup/code
/usr/bin/tar zcfp /root/backup/everyday/$codeBakName /root/backup/code
/usr/bin/rsync -vzrtopgu -progress /cygdrive/d/db/fan16cn/* /root/backup/db
/usr/bin/tar zcfp /root/backup/everyday/$dataBakName /root/backup/db
/usr/bin/find /root/backup/everyday ! -mtime -7 -exec /usr/bin/rm {} \;

