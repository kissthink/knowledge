.. _route:

route命令使用
================

配置路由及网关

指定路由及网关::

    route add -net <路由地址> gw <网关地址> [ netmask <子网掩码> ] dev <网卡>

删除路由及网关::

    route del -net <网关地址> gw <网关地址> [ netmask <子网掩码> ]

设置默认网关::

    sudo route add default gw 192.168.10.1
