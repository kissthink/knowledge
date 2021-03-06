.. _netstat:

netstat命令使用
######################

基本用法::

    netstat -nltp   // debain用法
    netstat -nlup

    netstat -anp tpc // freebsd用法


描述(linux)
===============
::

   --statistics , -s
       Display summary statistics for each protocol.

   --route , -r
       Display the kernel routing tables.

   --interface=iface , -i
       Display a table of all network interfaces, or the specified iface).


选项说明(linux)
======================
::

   --numeric , -n
       Show numerical addresses instead of trying to determine symbolic host, port or user names.

   -c, --continuous
       This will cause netstat to print the selected information every second continuously.

   -l, --listening
       Show only listening sockets.  (These are omitted by default.)

   -a, --all
       Show both listening and non-listening sockets.  With the --interfaces option, show interfaces that are not marked

   -p, --program
       Show the PID and name of the program to which each socket belongs.

   -u, --udp
   -t, --tcp


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

    netstat -antup


查看ddos情况::

    netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr


查看php-fpm长连接情况::

    sh> netstat -nap |grep <port>    // 其中<port>为php请求的长连接服务端口
    tcp        0      0 192.168.35.141:48361    10.1.4.112:4230         TIME_WAIT   -               
    tcp        0      0 192.168.35.141:48358    10.1.4.112:4230         ESTABLISHED 6582/php-fpm: pool
    tcp        0      0 192.168.35.141:48357    10.1.4.112:4230         ESTABLISHED 6473/php-fpm: pool
    // 说明: 
    // 1. ESTABLISHED: 连接建立后没有释放
    // 2. TIME_WAIT: 连接关闭后释放资源的过程



