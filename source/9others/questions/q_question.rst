.. _q_question:

一问一答
=============

以下三个是说“创建ssh远程登录欢迎词”
--------------------------------------------

获取cpu个数(unchecked)
"""""""""""""""""""""""""""""
::

    nu1=`cat /proc/cpuinfo |grep processor|sed '$!d'|awk '{print $3}'`
    let "nu=($nu1+1)"
    cupname=`cat /proc/cpuinfo |grep "model name"|sed '$!d'|awk '{print $4 " " $5 " " $7}'`
    echo cat   /proc/cpuinfo $cupname x$nu >> /etc/motd
    let "nginxprocesses=($nu*2)"
    sed -i "s@worker_processes 4@worker_processes [url=mailtonginxprocesses@g]$nginxprocesses@g[/url]" /data/conf/nginx/nginx.conf

获取内存大小(unchecked)
"""""""""""""""""""""""""""
::

    Free=`free -m |grep Mem |awk '{print $2}'`
    echo cat /proc/meminfo   MemTotalFree MB >> /etc/motd

获取磁盘信息(unchecked)
""""""""""""""""""""""""""
::

    fdisk -l|grep "Disk"|awk '{print $1 " " $2 " " $3 " " $4}'|sed 's/,/ /g' >> /etc/motd
    echo 'df -lhT' >> /root/.bash_profile







