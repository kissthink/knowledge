查看相关命令
--------------------

* Show命令::

    我们可以通过show命令查看MySQL状态及变量，找到系统的瓶颈：
    Mysql> show status ——显示状态信息（扩展show status like ‘XXX’）
    Mysql> show variables ——显示系统变量（扩展show variables like ‘XXX’）
    Mysql> show innodb status ——显示InnoDB存储引擎的状态
    Mysql> show processlist ——查看当前SQL执行，包括执行状态、是否锁表等
    Shell> mysqladmin variables -u username -p password——显示系统变量
    Shell> mysqladmin extended-status -u username -p password——显示状态信息


* 查看状态变量及帮助::

    Shell> mysqld –verbose –help [|more #逐行显示]

* 比较全的Show命令的使用可参考： http://blog.phpbean.com/a.cn/18/

