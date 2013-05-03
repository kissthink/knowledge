.. _mysql_config:

MySQL配置文件修改
##########################

配置文件加载顺序(只是mysql客户端??)
===========================================
::

    /etc/my.cnf /etc/mysql/my.cnf /usr/local/mysql/etc/my.cnf ~/.my.cnf 

配置文件修改
==========================
* 修改配置文件 ``my.cnf``
* 直接修改配置变量::

    SET GLOBAL <variableName> = <variableValue>



文件詳細说明
==================

.. literalinclude:: ./files/my.cnf
    :language: mysql
    :emphasize-lines: 12,15-18
    :linenos:


