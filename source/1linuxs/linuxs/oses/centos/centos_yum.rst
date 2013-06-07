.. _yum:

centos操作系统yum命令
======================
因为yum默认的是使用python2.4,为了使yum命令能正确执行,需要修改
[root@CNC-BJ-5-3N1 bin]# vi yum
将#!/usr/bin/python 改为 #!/usr/bin/python2.4


.. _os_centos_install:

yum命令
--------
用法::

    yum [options] COMMAND

常用命令::

    yum search 
    yum install
    yum list

软件安装
--------

**automake安装**
    * 命令::

        yum install automake

    * 依赖:

        * autoconf
        * imake


.. _os_centos_php:

有关php的操作
------------------

* 只安装php::

        yum install -y php

* 安装运行库及MySQL的支持::

    yum install -y php php-devel php-mysql

* 系统是CentOS 5.6那么上面这条命令安装的是PHP 5.1,要安装 PHP 5.3则执行下面的命令::

    yum install -y php53 php53-devel php53-mysql


