.. _netstat:

netstat命令使用
######################

SYNOPSIS
===========
.. option:: -t, --tcp

   tcp

.. option:: -u, --udp

   udp



DESCRIPTION
==============
.. option:: -r, --route

   查看路由表, 与 ``route -e`` 命令結果一样



OPTIONS
==========

.. option:: -n, --numberic

   展示数字化地址, 而不用转化ip、port或用户名(可以加速操作)

.. option:: -c, --continuous(默认是 ``1s`` )

   每隔一个固定时间, 执行该netstat命令

.. option:: -s, --statistics

   按各个协议进行统计

.. option:: -p, --program

   显示建立相关链接的程序名

.. option:: -l, --listening

   仅列出有在 Listen 的sockets(默认选项)

.. option:: -a, --all

    列出listen&non-listen 的sockets, PS: With the ``--interfaces`` option, show interfaces that are not up


实例
============


netstat  网络连接状态
::

    netstat -nutlp | grep 3306
    or
    netstat -nutlp | grep mysql

::

    netstat -nlp        //查看系统当前监听的端口
    netstat -nap  // -p, --programs


查看ddos情况::

    netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr





