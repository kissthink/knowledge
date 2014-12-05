MySQL简单错误
####################

MySQL数据库无法远程连接
--------------------------

* 没有授予相应的权限
* 防火墙禁止了3306端口或DB没有使用3306端口
* 修改MySQL的配置文件 ``/etc/mysql/my.cnf`` ::

    # bind-address = 127.0.0.1


root用户不能给新用户赋值权限
---------------------------------
::

    // 给此用户指定DB的权限
    ERROR 1044 (42000): Access denied for user 'root'@'localhost' to database '<DB>'
    // 给此用户全部DB的权限
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)

    // 原因
    root用户没有with grant option权限
    给user表的grant_priv值赋为Y,然后flush privilege;






