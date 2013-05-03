.. _mysql_security:

06. 安全
============

* 基本安全:

    * 密码够好
    * 不给用户不需要的权限
    * 在应用程序端确保无sql注入

* 安装本身安全:

    确保数据文件、日志文件以及其他所有安装文件对无权限用户是不可读不可写的

* 在数据库系统本身用户的控制与安全
* MySQL和你系统的网络安全:

    有安全权限的用户只能本地或限定到特定的主机！


子目录:

.. toctree::
   :maxdepth: 2

   06securitys/security_general
   06securitys/security_privilege
   06securitys/security_accountmanage




http://dev.mysql.com/doc/refman/5.5/en/security.html
