.. _linux_skill:

Linux技巧
###################

使用nfsd远程共享目录
========================
本地::

    // 开启nfsd服务
    sudo nfsd enable
    // 设定共享目录
    sudo cat << EOF >> /etc/exports
        /<workspace>/www -alldirs -ro -network 192.168.0.0 -mask 255.255.0.0
    EOF
    // 更新配置
    sudo nfsd update

    // mac下使用这两个命令检查已启动的NFS共享目录：
    nfsd checkexports
    showmount -e <host>     //查看此host下的共享目录

远程机器::

    sudo umount -l /disk
    sudo mount -t nfs -o rw <本地ip>:/<workspace>/www /disk

centos下使用移动硬盘
=============================

* 下载文件 ``ntfs-3g_ntfsprogs-2012.1.15.tgz`` 并安装
* 使用 ``mount -t ntfs-3g /dev/sdb1 /media/usb``

ulimit修改办法
=======================

* 修改文件 ``/etc/security/limits.conf``
* 文件尾部增加::

    * soft nofile 51200
    * hard nofile 51200

* 退出控制台，重新登陆使用命令 ``ulimit -n``

Linux下如何查看CPU信息, 包括位数和多核信息
====================================================

* 查看当前操作系统内核信息::

    #uname -a
    Linux redcat 2.6.31-20-generic #58-Ubuntu SMP Fri Mar 12 05:23:09 UTC 2010 i686 GNU/Linux

* 查看当前操作系统发行版信息::

    #cat /etc/issue
    Ubuntu 9.10 \n \l

* 查看cpu型号::

    # cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c
    2  Intel(R) Core(TM)2 Duo CPU     P8600  @ 2.40GHz
    (看到有2个逻辑CPU, 也知道了CPU型号)

* 查看物理cpu颗数::

    # cat /proc/cpuinfo | grep physical | uniq -c
    2 physical id    : 0
    (说明实际上是1颗2核的CPU)

* 查看cpu运行模式::

    # getconf LONG_BIT
    32
    (说明当前CPU运行在32bit模式下, 但不代表CPU不支持64bit)

* 查看cpu是否支持64bit::

    #cat /proc/cpuinfo | grep flags | grep ' lm ' | wc -l
    2
    (结果大于0, 说明支持64bit计算. lm指long mode, 支持lm则是64bit)

* 查看cpu信息概要::

    #lscpu

Linux 如何查看主机的cpu个数和总内存
=========================================
* check_cpu::

    Check_cpu_model=`grep /proc/cpuinfo "model name"|uniq`
    Check_cpu_physical=`grep 'physical id' /proc/cpuinfo | sort | uniq | wc -l`
    Check_cpu_processor=`grep processor /proc/cpuinfo | wc -l`
    Check_cpu_flags=`grep flags /proc/cpuinfo | uniq | egrep -o -w "rm|tm|lm"`

* check_memory::

    Check_mem_use_state=`dmidecode |grep -P -A 5 "Memory Device" |grep Size |grep -v Range`
    Check_mem_support_max=`dmidecode |grep -P "Maximum Capacity"`
    Check_mem_speed=`dmidecode | grep -A16 “Memory Device” | grep ‘Speed’`



按顺序列出内存占用率的进程
===================================
::

    ps -A --sort -rss -o comm,pmem,pcpu |uniq -c |head -15

查看linux版本号的命令
==========================
::

    cat   /proc/version
    uname   -a


