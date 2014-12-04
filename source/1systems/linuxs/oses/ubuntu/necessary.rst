debian服务器安装依赖
=========================

::

    apt-get install emacs tmux vim git-core

    // 压缩相关
    apt-get install zip unzip tar

    // web服务器
    apt-get install php5-fpm mysql-server mysql-common mysql-client nginx




ubuntu常见的信赖包::
    // 右键添加打开终端的快捷菜单
    sudo apt-get install nautilus-open-terminal

    安装解压文件
    apt-get install unace unrar zip unzip p7zip-full p7zip-rar
    sharutils rar uudeview mpack lha arj cabextract file-roller

    //配置中文环境 [这个在新系统中一般用不到了]::
    sudo apt-get install language-support-zh

    //安装emacs
    sudo apt-get install emacs

    //安装c或者c++编译及配置库
    sudo apt-get install g++ libboost-dev libevent-dev python-dev 
    automake autoconf pkg-config libtool flex bison

工具包
---------

pdfeditor(Xournal和Okular都可以实现添加批注，但pdfedit是真正的PDF编辑软件)::

    * sudo apt-get install pdfeditor



以下是从源文件安装时的信赖:
-----------------------------

* 安装pcre-devel::

    apt-get install libpcre3-dev

安装erlang时的信赖:
---------------------

* 安装curses/termcap::

    apt-cache search ncurses
    apt-get install libncurses5-dev

* 安装OpenSSL::

    apt-get install libssl-dev

* 安装ODBC库::

    apt-get install unixodbc unixodbc-dev

* 安装xsltproc and fop::

    apt-get install fop
    apt-get install xsltproc

* 安装wx driver驱动::

     apt-get install freeglut3-dev libwxgtk2.8-dev g++




