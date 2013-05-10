.. -*- coding: utf-8 -*-
.. _mongodb_usage:

MongoDB的使用
#######################
mongo的启动与关闭::

    // 启动
    mongod
    //关闭
    kill -2 <pid>    # SIGINT
    or
    kill <pid>  #SIGTERM


mongod启动的选项
=======================

.. option:: --dbpath

   指定数据目录, 默认是 ``/data/db/`` (windows下是 ``C:\data\db``)

.. option:: --port

   指定服务器端口, 默认端口是27017

.. option:: --fork

   以保护进程的方式运行MongoDB, 创建服务器进程

.. option:: --logpath

   指定日志输出路径,而不是输出到命令行(想保留原来日志,还需要使用 ``--logappend`` )

.. option:: --config

   指定配置文件,加载命令行未指定的各种选项


实例
=======

简单实例::

    mongodb --port 5586 --fork --logpath mongodb.log

通过配置文件配置::

    linux> mongodb --config ~/mongodb.conf
    linux> vi ~/mongodb.conf
    port = 5586
    fork = true

    logpath = mongodb.log



