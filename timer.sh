#!/usr/bin/env bash

echo "test timer"
path="."

while true
do
    #echo "a"
    time1=`date -d '2011-12-11 17:40:00' "+%s"` #設定一个时间点
    time2=`date "+%s"` #得到当前时间点
    
    period=$(($time1-$time2)) #得到两时间点间的时间段
    
    reminder=$(($period%30)) #修正一下
#    echo $time1
#    echo $time2
#    echo $reminder---$period

    if [ "$reminder" -eq 0 ]
    then
    	echo "git pull origin master"
        git pull origin master

    fi

 done