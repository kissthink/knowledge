.. _linux_question:

linux问题汇总
#####################

新建用户
==========
::

    useradd -m -s /bin/bash $1
    usermod -a -G adm $1


替换linux文件中的内容
============================

::

    find . -type f -exec sed -i 's/要被替换的字串/替换后的字串/g' {} \;


如何修改修改linux的host name
"""""""""""""""""""""""""""""""""

有两种办法:

* 用hostname命令来修改,这样的修改是暂时的,重启之后还会还原为之前的,所以我们如果你要永久修改host name的话,请看下面的办法
* 用vi打开 ``/etc/sysconfig/network`` ,命令式: ``vi /etc/sysconfig/network`` ,然后看到里面有一个hostname = <hostname>把后面的修改为你想要的host name即可,这样保存在重启就不会还原了


有了openssh密钥，如何生成putty ssh密钥:
"""""""""""""""""""""""""""""""""""""""""""

假设openssh的私钥名为Identity则，在linux上，使用puttygen命令如下::

    puttygen Identity -o Identity.ppk -O private

这样可以使用生成的.ppk文件登陆openssh服务器了。


如何实现只能通过ssh私钥登录
""""""""""""""""""""""""""""""""
修改/etc/ssh/sshd_config文件::

    PermitRootLogin no          //修改为no(禁止root登陆)
    PubkeyAuthentication yes    //允许ssh登陆
    AuthorizedKeysFile     .ssh/authorized_keys         //設定ssh登陆
    PasswordAuthentication no              //禁止密码登陆

    //可以让你在远程机器上执行gui程序然后在"本地"显示图形
    AllowTcpForwarding yes
    X11Forwarding yes


重启sshd::

    service sshd restart

如何增加一个有root权限的用户
"""""""""""""""""""""""""""""""""""""

* 修改/etc/sudoers文件，修改命令必须为visudo才行(为安全用此命令)::

    sudo visudo

* 修改里面的内容完成，可以使用如下命令查看你具有何权利::

    sudo -l

* ``/etc/sudoers`` 文件


linux命令环境变量(bashrc)
"""""""""""""""""""""""""""""""""""

* bash的几个初始化文件::

    /etc/profile
    /ect/bashrc(主要修改对象)
    ~/.profile
    ~/.bash_login
    ~/.bash_profile(主要修改对象)
    ~/.bashrc
    ~/.bash_logout


Too many authentication failures
"""""""""""""""""""""""""""""""""""
::

    >> ssh root@58.56.108.133
    Received disconnect from 58.56.108.133: 2: Too many authentication failures for root

原因: .ssh/文件夹下面的东西太多了



查看此网站web服务器
""""""""""""""""""""""""
::

    curl -s -I http://blog.programfan.info | grep Server

如何解决centos系统汉字乱码问题(?????)
""""""""""""""""""""""""""""""""""""""""""
::

    yum -y install fonts-chinese
    yum install fonts-chinese.noarch # 安装中文字体
    sudo yum install fonts-ISO8859-2-75dpi.noarch # 字体显示包

系统出问题时查看日志方法
==============================
::

    dmesg:日志察看
    lspci
    file /bin/cp
    strings /bin/cp
    md5sum /bin/cp
    fdisk -l
    smartctl /dev/md0
    /etc/init.d/syslog start
    w/who(w gordon, who -HT)
    执行last命令其实是显示/var/log/目录下的wtmp文件内容。Wtmp文件是以二进制格式进行存储的

    查看sc用户登录历史
    >> last sc

    last
    lastlog
    histroy
    lastb(?)

    tty表示显示器,pts表示远程连接


系统出问题时查看日志方法2
===================================
* 频繁重启的原因，如果不是入侵，绝对是硬件,看CPU的温控，内存,之后硬盘( ``>> last`` )::

    reboot   system boot  2.6.18-308.el5   Wed Feb 27 22:35          (12:35)
    reboot   system boot  2.6.18-308.el5   Wed Feb 27 22:31          (12:39)
    reboot   system boot  2.6.18-308.el5   Wed Feb 27 22:26          (12:44)
    reboot   system boot  2.6.18-308.el5   Wed Feb 27 22:22          (12:48)

* 有人尝试密码( ``/var/log/secure`` )::

    Feb 28 05:14:18 ubuntu196 sshd[10555]: Failed password for root from 183.60.159.21 port 38818 ssh2
    Feb 28 05:14:18 ubuntu196 sshd[10557]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=183.60.159.21  user=root

* cron任务，没关系(/var/log/secure)::

    Feb 28 05:17:01 ubuntu196 CRON[10559]: pam_unix(cron:session): session opened for user root by (uid=0)
    Feb 28 05:17:01 ubuntu196 CRON[10559]: pam_unix(cron:session): session closed for user root





假双线查询
============================

* 使用如下命令查看ip转向::

    $ tracert <ip>
    $ tracert <domain>
    or
    $ mtr <domain>
    or
    tracepath <domain>


* 进入服务器使用如下命令查看双线映射路由表::

    route -e
    or
    netstat -r



/root 挂载点没空间解决方案
==================================
::

    > dpkg –get-selections|grep linux
    > apt-get remove <soft_version>

如何查询linux服务器是64位还是32位
==============================================
* 32位的系统中int类型和long类型一般都是4字节, 64位的系统中int类型还是4字节的, 但是long已变成了8字节inux系统中可用"getconf WORD_BIT"和"getconf LONG_BIT"获得word和long的位数. 64位系统中应该分别得到32和64(getconf命令还可以获取系统的基本配置信息，比如操作系统位数，内存大小，磁盘大小等. ``$getconf -a`` 可以看到详细的系统信息)::

    #getconf LONG_BIT
    #getconf WORD_BIT

* X686或X86_64则内核是64位的，i686或i386则内核是32位的::

    #uname -a

* 直接看看有没有/lib64目目录的方法。64位的系统会有/lib64和/lib两个目录，32位只有/lib一个
* 以下命令::

    #file /sbin/init
    #file /bin/cat
    #uname -m
    #arch
    # echo $HOSTTYPE

* 查看cpu是多少位的::

    #more /proc/cpuinfo

Linux Centos 查看CPU信息、机器型号等硬件信息
================================================

* 查看机器所有硬件信息::

    dmidecode |more
    dmesg |more

* 查看主板信息:

   lspci

* 查看网卡信息::

     ethtool eth0       # 不一定所有网卡都支持此命令
     ethtool -i eth1 加上 -i 参数查看网卡驱动

     dmesg | grep eth0 等看到网卡名字(厂家)等信息
     


* 查看CPU信息（型号）::

    # cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c
    8 Intel(R) Xeon(R) CPU E5410 @ 2.33GHz
    (看到有8个逻辑CPU, 也知道了CPU型号)

    # cat /proc/cpuinfo | grep physical | uniq -c
    4 physical id : 0
    4 physical id : 1
    (说明实际上是两颗4核的CPU)
    # PS: 其实是可能有超线程HT技术，不一定是有4核，也可能是2核4线程

    # getconf LONG_BIT
    32
    (说明当前CPU运行在32bit模式下, 但不代表CPU不支持64bit)

    # cat /proc/cpuinfo | grep flags | grep ‘ lm ‘ | wc -l
    8
    (结果大于0, 说明支持64bit计算. lm指long mode, 支持lm则是64bit)

    再完整看cpu详细信息, 不过大部分我们都不关心而已.
    # dmidecode | grep ‘Processor Information’

    查看内存信息
    # cat /proc/meminfo

    # uname -a
    Linux euis1 2.6.9-55.ELsmp #1 SMP Fri Apr 20 17:03:35 EDT 2007 i686 i686 i386 GNU/Linux
    (查看当前操作系统内核信息)

    # cat /etc/issue | grep Linux
    Red Hat Enterprise Linux AS release 4 (Nahant Update 5)
    (查看当前操作系统发行版信息)

    查看机器型号
    # dmidecode | grep “Product Name”

    查看网卡信息
    # dmesg | grep -i eth


cpu负载查询
===================

* 负载一般是由cpu或io造成
* 每个CPU内核的当前活动进程数不大于3的话，那么系统的性能是良好的。如果每个CPU内核的任务数大于5，那么这台机器的性能有严重问题
* 查询负载命令::

    uptime
    top
    dstat(查看具体原因)
    iostat(查看io)

ssh问题
==========
* Agent admitted failure to sign using the key.
* Permission denied (publickey,gssapi-with-mic).
* Permission denied (publickey,keyboard-interactive).
* Permission denied (publickey,password).    // 3次密码输入错误
* ssh_exchange_identification: read: Connection reset by peer(1.运营商2.尝试次数太多ip被防火墙干掉了)


``sysctl -p`` 的时, 报 ``error: 'net.ipv4.ip_conntrack_max' is an unknown key``
======================================================================================
为linux kernel ``ip_conntrack`` 模块::

    /sbin/modprobe ip_conntrack






