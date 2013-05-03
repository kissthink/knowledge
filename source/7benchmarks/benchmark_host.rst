.. _benchmark_host:

测试时主机环境
================

* 操作系统环境::

    $ uname -a
    Linux shudu-desktop 2.6.32-38-generic #83-Ubuntu SMP Wed Jan 4 11:13:04 UTC 2012 i686 GNU/Linux

* cpu环境::

    $ grep "model\ name" /proc/cpuinfo 
    model name : Intel(R) Core(TM)2 Duo CPU     E8400  @ 3.00GHz
    model name : Intel(R) Core(TM)2 Duo CPU     E8400  @ 3.00GHz

* 内存环境::

    $ free -m
                 total       used       free     shared    buffers     cached
    Mem:          1995       1130        864          0         80        341
    -/+ buffers/cache:        708       1286
    Swap:         2491          0       2491

* 句柄环境::

    $ cat /etc/security/limits.conf
    root soft nofile 65535
    root hard nofile 65535
    gordon soft nofile 65535
    gordon hard nofile 65535



