.. _configure:

16.1 配置文件
===============


* master和slave都必需有一个统一的id(server-id选项).
* slave必须配置好

    * master host name
    * log file name
    * position within that file

* 这些也可以在 ``slave`` 上的MySQL session中用 ``change master to`` 语句来改变
* 这些被存储在 ``slave`` 的 ``master.info`` 文件中

* 本章描述了“复制”环境所需的安装、配置！包含一步步创建复制环境的指南！主要内容包括:

    * 为两台或多台服务器“复制操作”安装、配置的指南(见16.1.1 如何建立复制)——处理系统配置并提供在master与slaves间的拷贝
    * 在二进制日志下的事件是一系列格式的记录(SBR, RBR, MIXED)(见16.1.2 复制格式)
    * 不同配置选项和变量在“复制”中所产生的具体作用(见16.1.3 复制与二进制日志选项与变量)
    * 启动复制后，你需要很少的管理与监控，但你需要运行的常用任务(见16.1.4 复制常用的管理任务)



.. toctree::
   :maxdepth: 2

   configures/replication_setup
   configures/replication_format
   configures/replication_binarylog_option
   configures/replication_adminstrator

