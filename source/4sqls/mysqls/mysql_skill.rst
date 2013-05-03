.. _mysql_skill:

MySQL小技巧
###########################

* 当你使用多行输入时，如果打错想放弃输入使用命令 ``\c``::

    mysql> SELECT
       -> USER()
       -> \c
    mysql>

* 巧用linux管道，让mysql执行大量脚本文件::

    cat /sqldir/*.sql | mysql -u username -p 





