#!/bin/bash
status='Waiting for table level lock'
#status='sleep'
passwd='xxoo'
n=`/usr/local/bin/mysqladmin processlist -uroot -p$passwd |grep -i "$status" |wc -l`
if [ $n -gt 0 ]
then
    for i in `/usr/local/bin/mysqladmin processlist -uroot -p$passwd |grep -i "$status" |awk '{print $2}'`
    do
        /usr/local/bin/mysqladmin -uroot -p$passwd kill $i
    done
fi

echo 'Mysql is OK! Not need to do anything!'
