.. _security_privilege:

6.2. MySQL权限系统
====================

* 有以下几项mysql权限系统不能做到:

    * 你不能指定拒绝某一指定用户
    * 你不能設定一用户，它能创建和删除某一DB中表的权限，但没有创建或删除DB本身的权限
    * 密码对一用户是全局的，你不能对某一对象(DB，表或routine)指定一密码。

* 权限改变生效时间:

    * 如果你用帐号管理語句如GRANT， REVOKE， SET_PASSWORD或RENAME_USER来间接修改授权表，立即生效
    * 如果你用語句INSERT,UPDATE和DELETE直接修改授权表时，这不会立即生效，需要重启服务或用如下方法重载这些表::

        mysql> FLUSH PRIVILEGES
        or
        shell> mysqladmin flush-privileges
        or
        shell> mysqladmin reload
