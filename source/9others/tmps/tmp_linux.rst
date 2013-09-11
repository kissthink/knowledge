.. _tmp_linux:

linux
======


Linux 自检和 SystemTap 用于动态内核分析的接口和语言::

    $ sudo apt-get install systemtap

在安装完成之后，您可以测试内核看它是否支持 SystemTap。为此，使用以下简单的命令行脚本::

    $ sudo stap -ve 'probe begin { log("hello world") exit() }'


如果该脚本能够正常运行，您将在标准输出 [stdout] 中看到 “hello world”。如果没有看到这两个单词，则还需要其他工作。


把它设小linux就不倾向使用swap 反之则用swap. 最后推荐设为10::

    /proc/sys/vm/swappiness

erlang的beam模拟器:

    * beam   默认的
    * beam.smp               支持多处理器的
    * beam.hybrid            支持混合堆的



我们允许erl的时候 在linux下实际运行的是shell脚本::


    #!/bin/sh
    ROOTDIR=/usr/local/lib/erlang
    BINDIR=$ROOTDIR/erts-5.5.5/bin
    EMU=beam
    PROGNAME=`echo $0 | sed 's/.*\///'`
    export EMU
    export ROOTDIR
    export BINDIR
    export PROGNAME
    exec $BINDIR/erlexec ${1+"$@"}

这个脚本给erlexec 设置写必须的环境变量 具体调用那个模拟器是在erlexec里面根据 参数区分 -smp -hybrid来分别调用不同
的beam


翻erlang的代码发现erlang对memory的管理非常重视 内置了多种内存allocator::

     * B: binary_alloc
     * D: std_alloc
     * E: ets_alloc
     * F: fix_alloc
     * H: eheap_alloc
     * L: ll_alloc
     * M: mseg_alloc
     * S: sl_alloc
     * T: temp_alloc
     * Y: sys_alloc


多种分配策略::

    * Best fit
    * Address order best fit
    * Good fit
    * A fit

http://www.sics.se/~joe/apachevsyaws.html 上比较yaws的性能 显示apache 4000就挂了 但是yaws 8w还在挺着。

测试::

     ab -c 1000 -n 1000000 http://192.168.0.98:8000/bomb.gif

     strace -p xxx -T

经常的时候看大型工程的时候 碰到一二个地方实在不明白他是如何运作的 这时候最好的工具就是debugger 如gdb，的backtrace 可以得到完整的函数调用栈。在linux下推荐使用ddd, 俺的centos5 下标准版本没有安装ddd 顺手下载个安装就好了（标准版本却个motif-devel yum下就好）。ddd图形界面方便查看函数和变量，还有点击跳转功能。 附上几个调试erlang的脚本，希望能够方便大家:

* first::

    [root@test98 ~]# cat gdb_beam
    #! /bin/bash
    ddd -x gdb.init /usr/local/lib/erlang/erts-5.5.5/bin/beam

* second::

    [root@test98 ~]# cat gdb.init
    set arg -- -root /usr/local/lib/erlang -progname erl -- -home /root

* third::

     [root@test98 ~]# tail .bash_profile -n 13

     export PATH=$PATH:/usr/local/lib/erlang/erts-5.5.5/bin
     ROOTDIR=/usr/local/lib/erlang
     BINDIR=$ROOTDIR/erts-5.5.5/bin
     EMU=beam
     PROGNAME=`echo $0 | sed 's/.*\///'`
     export EMU
     export ROOTDIR
     export BINDIR
     export PROGNAME
     export EDITOR=vim

     export LANG=utf8

如果你要调试 ``beam.smp beam.hybrid 可以erl -smp true +K true -emu_args`` 得到参数::

    Executing: /usr/local/lib/erlang/erts-5.5.5/bin/beam.smp 
    /usr/local/lib/erlang/erts-5.5.5/bin/beam.smp -K true -- -root 
    /usr/local/lib/erlang -progname erl -- -home /root -smp true

把以上脚本改下就方便多了。



1. 察看glibc版本号:
    dpkg-query -l glibc*
2. 如何更改环境变量PATH的值:
    编辑 `` ~/.bash_profile`` 或者 `` ~/.bashrc`` 文件，找到 **PATH** 环境变量,如果找不到增加如下一行::

        export PATH=${PATH}:path1:path2...

3. tmp
    * sudo dpkg-reconfigure tzdata.来修改时区
    * curl ...
    * sudo apt-get install scim-tables-zh：五笔安装[未成功]
    * rsync数据同步

