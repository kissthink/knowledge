.. _mysql_importAndExport:

MySQL的Import and Export
=========================

**导出操作**

    * 导出整个数据库::

        mysqldump -umysql -psa dataBaseName > fileName.sql

    * 导出一个表::

        mysqldump -umysql -psa dataBaseName tablename > fileName.sql

    * 仅仅备份数据库结构::

        mysqldump --no-data --databases databasename1 databasename2 databasename3 > fileName.sql

    * 备份服务器上所有数据库::

        mysqldump --all-databases > fileName.sql

    * 

**导入数据**

    * 把sql文件导入到指定数据库下(命令行方式)::

        mysql -hhostname -uusername -ppassword databasename < fileName.sql

    * 把sql文件导入到指定数据库下(sql命令行方式)::

        mysql -u root -psa
        mysql> use dataBaseName;
        mysql> source /path/to/fileName.sql

    * 其他::

        use /Users/venmos/backup.sql //导入/Users/venmos/目录的backup.sql数据库


