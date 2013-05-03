.. _centos:


centos下特殊文件说明
====================

    * 设置主机名和网络配置 ``/etc/sysconfig/network`` ::

        HOSTNAME=<hostname> #这儿设置主机名,需要重启生效

    * 针对特定的网卡进行设置::

        /etc/sysconfig/network-scripts/ifcfg-eth0


    * 安全日志文件::

        /var/log/secure

    * yum源目录::

        /etc/yum.repos.d



