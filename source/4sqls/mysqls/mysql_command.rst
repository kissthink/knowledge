.. _mysql_command:

基本命令与实例
=======================

Contents:

.. toctree::
   :maxdepth: 1

   commands/cmd_shell
   commands/cmd_db
   commands/cmd_table
   commands/cmd_alter
   commands/cmd_select
   commands/cmd_update
   commands/cmd_insert
   commands/cmd_delete
   commands/cmd_index
   commands/cmd_event
   commands/cmd_declare
   commands/cmd_procedure
   commands/cmd_partition
   commands/cmd_lock
   commands/cmd_foreignkey
   commands/cmd_explain
   commands/cmd_profile
   commands/cmd_show
   commands/cmd_other
   commands/cmd_mysqladmin



各二进制说明:
http://dev.mysql.com/doc/refman/5.5/en/programs-overview.html

配置文件说明:
http://dev.mysql.com/doc/refman/5.5/en/mysqld-option-tables.html




实例操作
---------------


实例一::

    CREATE TABLE example1 {
        id int(11) NOT NULL AUTO_INCREMENT, -- int型，自增，非空
        date  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 时间类型，非空，默认是当前时间
        PRIMARY KEY(id) -- 主键
    }





