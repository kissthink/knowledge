.. _security_general:

6.1. 安全使用指南
==================


* 除了root用户外不要给任何其他用户mysql数据库的user表的访问权限(最重要)
* 了解MySQL让系统工作的权限情况，用 ``GRANT`` 和 ``REVOKE`` 語句控制到MySQL的权限。不要分配一些不必要的权限(注: 可以用 ``SHOW GRANTS`` 来查看权限，使用REVOKE把不必要的权限移除)
* 不要使用明码密码
* 不要使用简单密码
* 使用防火墙
* 应用程序要设法安全
* 学会使用 ``tcpdump`` 和 ``string`` 工具，它们可以帮你检查MySQL数据流是否被加密::

    shell> tcpdump -l -i eth0 -w - src or dst port 3306 | strings

说明: 如果你得到不是明文也不能说就一定加密了！你还需要更高级的检查！

* 绝对不要用系统用户root来启动mysql服务。这很危险，因为任何一个有文件权限(即用命令 ``GRANT`` 赋值)的用户，都可以让MySQL服务以系统root用户创建文件(因此，除非用选项 ``--user=root`` 指定，否则mysqld拒绝以root运行)
* 保证只有那个运行mysqld的系统用户可以读和写数据库目录
* 如果你不相信你的DNS，直接用IP会更好一些
* 如果你想限制一个帐号的连接次数可以在mysqld中使用 ``max_user_connections`` 
* 如果插件目录对mysql服务是可写的，mysql用户就可以使用 ``SELECT ... INTO DUMPFILE`` 命令往这个目录里写可执行文件！
* MySQLd与安全相关的选项:
  http://dev.mysql.com/doc/refman/5.5/en/privileges-options.html


