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


* 范例如下::

    目的主机监听
    nc -l 监听端口<未使用端口>  > 要接收的文件名
    nc -l 4444 > cache.tar.gz

    源主机发起请求
    nc  目的主机ip    目的端口 < 要发送的文件
    nc  192.168.0.85  4444 < /root/cache.tar.gz

    
