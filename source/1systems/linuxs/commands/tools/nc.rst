.. _nc:

nc命令使用
######################

实例
--------------

* 端口扫描::

    nc -v -w 2 <server ip> -z <port1>-<port2>

* 从<server2>拷贝文件到<server1>::

    server1> nc -l [port] > test.txt
    ...
    server2> nc [server1 Ip] <test.txt

* 简单聊天工具::

    server1> nc -l <port>
    ...
    server2> nc <server1 Ip> <port>
