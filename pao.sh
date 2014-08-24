#!/bin/bash
#Ã°ÅİËã·¨bash°æ
#made by Tyler
#time: 2014-08-24 17:15
#tmp=0
echo 'Please input some numbers:'
read numbers
arr=($numbers)
num=${#arr[*]}
for ((i=0;i < $num;i++))
do
    for ((j=`expr $num-1`;j > $i; --j))
    do
        if [ ${arr[$j]} -lt ${arr[$i]} ] 
        then
                tmp=${arr[$j]}
                arr[$j]=${arr[$i]}
                arr[$i]=$tmp
        fi
    done
done
echo ${arr[*]}
