.. _f_linux:

linux下特殊文件说明
########################

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


修改网络内核对TCP连接的有关限制
---------------------------------------

* ``/etc/sysctl.conf``




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

        #ChallengeResponseAuthentication yes——设定是否允许使用密码登录,如果使用密钥认证,可以把它禁止。
        #PermitRootLogin                 yes——是否允许root登录,建议禁止root登录,要用root只能用普通帐户登录后用su命令
        #Port                            22——指定登录端口,默认TCP 22端口,可以修改成其他端口,客户端登录时用-p选项指定端口

    * sudo权限相关文件 ``/etc/sudoers``

    .. literalinclude:: ./files/sudoers
       :language: nginx
       :linenos:


