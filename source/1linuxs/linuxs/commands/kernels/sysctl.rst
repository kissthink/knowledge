.. _sysctl:

sysctl命令
#################

* 修改内核配置 ``/etc/sysctl.conf``
* 修改后使用 ``sysctl –p`` 使配置生效



``/etc/sysctl.conf`` 内容::

    应用服务器sysctl.conf部分参数
    ## network configurations
    net.ipv4.ip_forward = 0 # IP packet forwarding
    net.ipv4.tcp_tw_reuse=1
    net.ipv4.tcp_tw_recycle=1
    net.ipv4.tcp_fin_timeout=30  #60,每条至多占 1.5K 的内存
    net.ipv4.tcp_keepalive_time=1800 #7200
    net.core.netdev_max_backlog=3000 #1000每个网络接口接收数据包的速率比内核处理这些包的速率快时，允许送到队列的数据包的最大数目
    net.ipv4.tcp_max_syn_backlog=4096  #1024 增加TCP SYN队列长度，使系统可以处理更多的并发连接
    net.core.wmem_default = 2097152 #108544,系统套接字缓冲区
    net.core.rmem_default = 2097152 #108544,系统套接字缓冲区
    net.core.rmem_max=16777216   #131071,系统套接字缓冲区
    net.core.wmem_max=16777216 #131071,系统套接字缓冲区
    net.ipv4.tcp_rmem=4096 87380 16777216  #4096   87380   174760, TCP接收缓冲区
    net.ipv4.tcp_wmem=4096 65536 16777216 #4096  16384   131072, TCP发送缓冲区
    net.ipv4.tcp_mem = 786432 1048576 1572864 # Out of socket memory
    net.ipv4.tcp_syncookies=1  #0,防SyncFlood攻击
    net.ipv4.ip_local_port_range = 32768 61000 #用于向外连接的端口范围,这是默认值
    net.ipv4.tcp_max_tw_buckets = 5000  #180000,同时保持TIME_WAIT套接字的最大数量
    #以下可能需要加载ip_conntrack模块 modprobe ip_conntrack
    # net.ipv4.ip_conntrack_max=6553600
    # net.ipv4.netfilter.ip_conntrack_tcp_timeout_established = 1800
    # net.ipv4.netfilter.ip_conntrack_max=6553600
    # net.ipv4.netfilter.ip_conntrack_tcp_timeout_time_wait=120
    # net.ipv4.netfilter.ip_conntrack_tcp_timeout_close_wait=60
    # net.ipv4.netfilter.ip_conntrack_tcp_timeout_fin_wait=120
    # net.ipv4.icmp_echo_ignore_all = 1 #0, Disable ping requests
    # net.ipv4.icmp_echo_ignore_broadcasts = 1 #1, Enable ignoring broadcasts request
    net.ipv4.neigh.default.gc_thresh3 = 40960 #1024
    net.ipv4.neigh.default.gc_thresh2 = 20480 #512
    net.ipv4.neigh.default.gc_thresh1 = 10240 #128
    ##以上三条语句可以解决内核中出现的如下两行错误
    #Linux kernel: printk: xxxxx messages suppressed.
    #Linux kernel: Neighbour table overflow.

    ## system configurations
    fs.file-max = 372901 #23712, 整个系统所有可打开文件总数的限制, 可按256/4M内存计算值。
    # ulimit -n 10000 #某一程序可打开文件 总数的限制
    # kernel.ctrl-alt-del = 1 #0,Disable CTR+ALT+DEL Restart Keys

    附:sysctl.conf
    fs.file-max = 372901
    net.ipv4.tcp_tw_reuse=1
    net.ipv4.tcp_tw_recycle=1
    net.ipv4.tcp_fin_timeout=30
    net.ipv4.tcp_keepalive_time=1800
    net.core.netdev_max_backlog=3000
    net.ipv4.tcp_max_syn_backlog=4096
    net.core.wmem_default = 2097152
    net.core.rmem_default = 2097152
    net.ipv4.tcp_rmem=4096 87380 16777216
    net.core.rmem_max=33554432
    net.ipv4.tcp_wmem=4096 65536 16777216
    net.core.wmem_max=33554432
    net.ipv4.tcp_mem = 786432 1048576 1572864
    net.ipv4.tcp_syncookies=1
    net.ipv4.tcp_max_tw_buckets = 180000
    net.ipv4.ip_conntrack_max=6553600
    net.ipv4.netfilter.ip_conntrack_max=6553600
    net.ipv4.netfilter.ip_conntrack_tcp_timeout_time_wait=60
    net.ipv4.netfilter.ip_conntrack_tcp_timeout_close_wait=30
    net.ipv4.netfilter.ip_conntrack_tcp_timeout_fin_wait=60
    net.ipv4.ip_local_port_range = 32768 61000




