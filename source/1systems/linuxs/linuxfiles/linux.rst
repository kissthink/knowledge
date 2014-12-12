.. _f_linux:

linux下特殊文件说明
########################
/etc/network/interfaces文件格式::

    # The loopback network interface
    auto lo
    iface lo inet loopback

    # The primary network interface
    allow-hotplug eth0
    allow-hotplug eth1
    auto eth0
    auto eth1
    iface eth0 inet static
      address 192.168.0.10
      netmask 255.255.255.0
      gateway 192.168.0.1
      metric 2

    iface eth1 inet static
      address 122.112.12.10
      netmask 255.255.255.224
      gateway 122.112.12.1
      metric 1


/etc/init.d/下文件书写格式
-------------------------------------

    .. literalinclude:: ./files/redisd
       :language: nginx
       :linenos:


修改用户进程可打开文件数限制
-------------------------------------

    * ``/etc/pam.d`` 指的是验证登陆配置, ``/etc/pam.d/login`` 是登陆配置文件,实例::

        //增加如下一行
        // 调用pam_limits.so模块来设置系统对该用户可使用的各种资源数量的最大限制(包括用户可打开的最大文件数限制)
        // 而pam_limits.so模块就会从/etc/security/limits.conf文件中读取配置来设置这些限制值
        session required /lib/security/pam_limits.so

    * 查看Linux系统级的最大打开文件数限制(Linux系统级硬限制)::

        /proc/sys/fs/file-max

    * 文件句柄、进程限制::

        /etc/security/limit.conf
        %修改文件句柄
        *     soft    nofile  65535
        *     hard    nofile  65535
        *     soft    noproc  11111
        *     hard    noproc  11111
        %注: root用户的话可以用命令ulimit -n 65535


* 修改网络内核对TCP连接的有关限制::

    ``/etc/sysctl.conf``


* 察看操作是哪个操作系统::
    
    /etc/issue

* 设置指定的域名解析地址::

    /etc/hosts

* ``.ssh/config`` 文件内容格式::

    host eqitonghub
    user git
    hostname 60.216.116.245
    port 22
    identityfile ~/.ssh/gordon.git

* 设置DNS::

    /etc/resolv.conf

* 日志消息目录::

    /var/spool/mail/

* 字符目录::

    Locale是根据计算机用户所使用的语言，所在国家或者地区，以及当地的文化传统所定义的一个软件运行时的语言环境
    /usr/share/i18n/locales/
    /usr/share/i18n/charmaps/    字符集

* path路径::

    /etc/profile
    %or
    ~/.bash_profile
    %添加如下命令(也可直接在shell里输入)
    PATH=/sbin:$PATH

* ssh服务相关文件::

    /etc/ssh/sshd_config

    AuthorizedKeysFile      %h/.ssh/authorized_keys
    PasswordAuthentication   no: 指定不允许密码登录
    PermitRootLogin          no: 不允许root用户登陆
    Port                     22: 指定登录端口,默认TCP 22端口
    AllowUsers happy test kaixin   指定允许登录用户

    ChallengeResponseAuthentication yes: @todo 未知是做啥的(估计是用于expect脚本登录)

* sudo权限相关文件 ``/etc/sudoers``

    .. literalinclude:: ./files/sudoers
       :language: nginx
       :linenos:


