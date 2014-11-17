.. _git_install:

###########
linux包安装
###########

命令::

    1. $ yum install git-core
    2. $ apt-get install git-core


########
原码安装
########

#. git的源码下载

    `下载地址 <http://www.kernel.org/pub/software/scm/git/>`_

#. 安装过程::

    1.$ tar xzvf git-1.6.5
    2.$ cd git-1.6.5
    3.$ ./config --prefix=/usr/local
    4.$ make
    5.$ sudo make install
    6.$ git --version

#. 帮助命令，可以键入'-help'就会显示出操作手册。你也可以键入 ``git help command`` 实现同样的目的::

    1.$ git log --help
    2.$ git help log
