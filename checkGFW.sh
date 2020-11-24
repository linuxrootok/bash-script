#!/usr/bin/sh
while read line
do
    echo $line
    res=`curl --connect-timeout 15 -s -k --head ${line}`
    echo $res
    #if $res is Null that this link is fail
    if [ ! -n "$res" ]; then
        domain=`echo $line |/usr/bin/cut -d/ -f 3`
        markFile="/root/tools/db/${domain}"
        if [ ! -f "$markFile" ]; then
            /usr/bin/echo 1 > $markFile
        else
            n=`/usr/bin/cat $markFile`
            nn=`expr $n + 1`
            /usr/bin/echo $nn > $markFile
        fi
        num=`/usr/bin/cat $markFile`
        if [ $num -le 3 ];then
            `/usr/bin/python /root/tools/sendEmail.py ${line}`
        fi

        t0=`/usr/bin/stat -c %Y $markFile`
        t1=`/usr/bin/date +%s`

        diffTime=`expr $t1 - $t0`
        if [ $diffTime -ge 86400 ];then
           `/usr/bin/rm -f $markFile`
        fi
    fi
done < /root/tools/domain.list
~
