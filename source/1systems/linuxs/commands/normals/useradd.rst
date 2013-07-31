.. _useradd:

useradd命令
============

**简介**

    create a new user or update default new user information

**概要SYNOPSIS**

       useradd [options] LOGIN

       useradd -D

       useradd -D [options]

**DESCRIPTION**

    .. option:: -m, --create-home:
      创建home目录
    .. option:: -s, --shell SHELL
      指定shell脚本，如 ``/bin/bash``
    .. option::  -d <home目录>
    .. option:: -G, --groups GROUP1[,GROUP2,...[,GROUPN]]]

        

    


**举例说明**

    * 实例一::

        useradd -m -s /bin/bash gordon
        useradd -G test -d /tmp/usr1 usr1
