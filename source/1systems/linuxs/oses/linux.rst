.. _os_linux:

linux命令
============

* 修改时区:

    * 找到相应的时区文件 /usr/share/zoneinfo/Asia/Shanghai 
    * 替换当前的/etc/localtime
    * 修改/etc/sysconfig/clock文件的内容为::

        ZONE="Asia/Shanghai" 
        UTC=false 
        ARC=false 

* 修改日期:

    * 时间设定成2008年9月10日的命令如下::

        date -s 09/10/2008

    * 将系统时间设定成上午10点25分0秒的命令如下::

        date -s 10:25:00 

* 同步biso时间:

    * 同步BIOS时钟，强制把系统时间写入CMOS，命令如下::

        clock -w

* perl命令::

    perl -MCPAN -e shell
    里面一些具体命令:
    i <soft> %具体要找的软件
    install <soft> %安装的软件
    m  %列出列表
    h  %請求帮助


* 启动网络管理服务::

    service NetworkManager start

以下三个是说“创建ssh远程登录欢迎词”
--------------------------------------------

获取cpu个数(unchecked)
::

    nu1=`cat /proc/cpuinfo |grep processor|sed '$!d'|awk '{print $3}'`
    let "nu=($nu1+1)"
    cupname=`cat /proc/cpuinfo |grep "model name"|sed '$!d'|awk '{print $4 " " $5 " " $7}'`
    echo cat   /proc/cpuinfo $cupname x$nu >> /etc/motd
    let "nginxprocesses=($nu*2)"
    sed -i "s@worker_processes 4@worker_processes [url=mailtonginxprocesses@g]$nginxprocesses@g[/url]" /data/conf/nginx/nginx.conf

获取内存大小(unchecked)
::

    Free=`free -m |grep Mem |awk '{print $2}'`
    echo cat /proc/meminfo   MemTotalFree MB >> /etc/motd

获取磁盘信息(unchecked)
::

    fdisk -l|grep "Disk"|awk '{print $1 " " $2 " " $3 " " $4}'|sed 's/,/ /g' >> /etc/motd
    echo 'df -lhT' >> /root/.bash_profile


