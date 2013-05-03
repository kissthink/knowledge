.. _ps:

ps命令使用
=================

显示进程信息,参数可省略::

       aux 以 BSD 风格显示进程 常用
       -efH 以 System V 风格显示进程
       -e , -A 显示所有进程
       a 显示终端上所有用户的进程
       x 显示无终端进程
       u 显示详细信息
       f 树状显示
       w 完整显示信息
       l 显示长列表
       -o <format>   //--format <format>


示例::

     ps alx               另一种常用输出格式


To see every process on the system using standard syntax::

    ps -e
    ps -ef
    ps -eF
    ps -ely

To see every process on the system using BSD syntax::

    ps ax
    ps axu

To print a process tree::

    ps -ejH
    ps axjf

To get info about threads::

    ps -eLf
    ps axms

To get security info::

    ps -eo euser,ruser,suser,fuser,f,comm,label
    ps axZ
    ps -eM

To see every process running as root (real & effective ID) in user format::

    ps -U root -u root u

用户自定义模式看进程::

    ps -eo pid,tid,class,rtprio,ni,pri,psr,pcpu,stat,wchan:14,comm
    ps axo stat,euid,ruid,tty,tpgid,sess,pgrp,ppid,pid,pcpu,comm
    ps -eopid,tt,user,fname,tmout,f,wchan

只打印syslogd的进程id::

    ps -C syslogd -o pid=

只打印PID为42的进程名::

    ps -p 42 -o comm=





实例
--------------

::

    ps -o rss
    ps -

