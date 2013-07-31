.. _centos_necessary:

centos常见的信赖包
=====================



* 中文环境::

    yum -y groupinstall chinese-support
    %% 修改/etc/sysconfig/i18n
    %% 将LANG修改为LANG="zh_CN.UTF-8"
    %% 重启，生效。

* 安装ncurses::

    yum install ncurses-devel

* 安装ssl::

    yum install openssl-devel

* 安装pcre-devel::

    yum -y install pcre-devel

* 安装openssl::

    yum -y install openssl openssl-devel

* 
