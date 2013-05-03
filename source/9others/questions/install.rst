.. _install:

#####
安装
#####

* No curses/termcap library found::
 
    apt-cache search ncurses
    apt-get install libncurses5-dev
 
* No usable OpenSSL found::

    apt-get install libssl-dev

*  ODBC library - link check failed"::

    apt-get install unixodbc unixodbc-dev

* jinterface : No Java compiler found(忽略问题)::

    ./configure --prefix=/home/erlang --without-javac

* xsltproc and fop is missing::

     apt-get install fop
     apt-get install xsltproc

*  wx : Can not link the wx driver, wx will NOT be useable::

     apt-get install  freeglut3-dev libwxgtk2.8-dev g++
