.. _mysql_command:

基本命令与实例
=======================

基本命令
-------------

shell操作mysql命令
^^^^^^^^^^^^^^^^^^^^^^^^^
::

    mysql -umysql -psa
    mysqladmin -u root -p shutdown

数据库级操作
^^^^^^^^^^^^^^^^^^^
::

    create database <database>;       //新建一个名为mydb的数据库
    drop database <database>          //删除一个名为mydb的数据库
    show databases          //查看数据库列表
    use databaseName;           //切换到指定数据库

    drop database [database name];  //删除数据库
    drop table [table name];    //删除数据表

    show columns from [table name]; //查看数据表各字段信息

表级操作
^^^^^^^^^^^^^^^^
::

    //查看本DB的所有表
    show tables;
    //查看表的创建信息
    show create table <tablename>;

    //显示表的当前状态值
    show table status\G
    show table status like '<tablename>'\G

    //查看数据表的详细结构
    describe(desc) [table name];

    //修改表属性
    alter table <tableName> type=innodb;
    //修改表名
    alter table <tableName> rename to <newTableName>

    // 修改表的自增id
    alter table tablename auto_increment=1

    //创建表时指定类型(MyISAM, InnoDB)
    create table <tableName>  ( 
        id int(11)  unsigned AUTO_INCREMENT PRIMARY KEY COMMENT "主键id",       -- 自增主键
        userId varchar(20) NOT NULL COMMENT "用户id",        -- 非空
        <field> <type> comment "<comment>"
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;


修改表字段
^^^^^^^^^^^^^^^^^^^^
::

    //修改字段名
    ALTER TABLE <tablename> CHANGE <oldcol> <newcol> varchar(200) PRIMARY KEY COMMENT "<comment>";
    //增加字段
    ALTER TABLE <tablename> ADD <newcol> varchar(200) NOT NULL default <value> comment "<comment>";
    ALTER TABLE <tablename> ADD <newcol> varchar(200) NOT NULL default <value> comment "<comment>" AFTER <col>;
    //增加主键
    ALTER TABLE trb1 ADD PRIMARY KEY (id);
    //删除字段
    ALTER TABLE <table_name> DROP COLUMN <column_name>;

    //增加主键设置
    ALTER TABLE <table_name> ADD PRIMARY KEY (<column_name1>, <column_name2>...);


select命令
^^^^^^^^^^^^^^^^^
::

        SELECT * FROM [tabName];//
        SELECT * FROM [table name] WHERE [field name] = "whatever";
        SELECT * FROM [table name] WHERE [field name] <> "whatever";  //不等于
        SELECT * FROM [table name] WHERE name = "Bob" AND phone_number = '3444444';

        // 模糊查询
        SELECT * FROM [table name] WHERE name like "Bob%";

        //取出满足条件的5条记录
        SELECT * FROM [table name] limit 1,5;
        select top 5 * from <tableName>; //不是sql92标准

        //特殊处理——消重、排序
        SELECT DISTINCT [column name] FROM [table name];//得到結果并消重
        SELECT [col1],[col2] FROM [table name] ORDER BY [col1, col2] DESC;//对結果按降序排列(升序用ASC)

        //一些常用内置函数
        SELECT COUNT(*) FROM [table name];//得到记录的得条数
        SELECT SUM([column name]) FROM [table name];//得到这列所有数的和.注:此列为数字

        --连表查询
        select * from (
          select <column> count(<column> as <column2> 
          from <tab> group by <column>
        ) as <tab2>
        where <tab2>.<column>=<???>

    * 做一个简单的计算器::

        mysql> SELECT SIN(PI()/4), (4+1)*5;
        mysql> SELECT CURDATE(), YEAR(CURDATE()), RIGHT(CURDATE(), 5), MOD(MONTH(CURDATE()), 12);
        说明> | 当前时间 | 当前时间年份 | 从右数5位数 | 用前面的值除后面的取余数
        result> | 2012-05-30 |            2012 | 05-30               | 5    |
        mysql> SELECT PASSWORD('password');

    * 时间处理::

        select timestampdiff(YEAR, '2010-04-01','2013-09-01');
        -- 3
        select timestampdiff(YEAR, '2010-04-01','2013-09-01');
        -- 41
        select timestampdiff(DAY, '2013-04-01','2013-09-01');
        -- 153
        select unix_timestamp('2013-05-26 14:42:24')-unix_timestamp('2013-05-26 14:39:44');
        -- 160(s)



        
update命令
^^^^^^^^^^^^^^^^
::

    update [tabName] set [field name]=[field value] where [field2 name]=[field2 value]

insert命令
^^^^^^^^^^^^^^^
::

    insert into <DB>.<Table> values (<value1>, <value2>, ...);
    INSERT INTO <tbl_name> (<col1>, <col2>) VALUES(15,col1*2); 

    insert into <DB>.<table> (<col1>, <col2>)
        select <column1>, <column2>
        from <table2>
        where ...
    ;

delete命令
^^^^^^^^^^^^^^^^^^^
::

    DELETE FROM <tbl_name> [WHERE where_definition]

索引操作
----------------
*  唯一索引(UNIQUE)
* 主键索引
* 全文本索引(innodb不支持myisam支持)

::

    //普通索引
    CREATE INDEX <indexName> ON <tableName> (<tableColumn1>, <tableColumn2>...);      //创建索引
    ALTER table <tableName> ADD INDEX <indexName> (<tableColumn1>, <tableColumn2>...);    //修改表结构
    CREATE TABLE tableName ( [...], INDEX [indexName] (<tableColumn1>, <tableColumn2>...) //创建表的时候直接指定

    //唯一索引
    CREATE UNIQUE INDEX indexName ON tableName(<tableColumn1>, <tableColumn2>);
    ALTER <tableName> ADD UNIQUE <indexName> ON (<tableColumn1>, <tableColumn2>);
    CREATE TABLE tableName ( [...], UNIQUE <indexName> (<tableColumn1>, <tableColumn2>);

    //删除索引
    DROP INDEX <index_name> ON <tableName>;    //删除索引的语法
    



其他命令
^^^^^^^^^^^^^^^^

::

    show engines; //命令可以显示当前数据库支持的存储引擎情况


察看mysql版本、时间、用户::

    mysql> SELECT VERSION(), CURRENT_DATE, NOW(), USER();


使用LOAD DATA命令载入数据::

    mysql> LOAD DATA LOCAL INFILE '/path/pet.txt' INTO TABLE pet;
    -- 其中pet.txt文件中的数据各字段以tab分隔
    -- 对无数据可以用NULL或\N来代替

    mysql> LOAD DATA LOCAL INFILE '/path/pet.txt' INTO TABLE pet
        -> LINES TERMINATED BY '\r\n';
    -- 如在windows系统下，以\r\n为行结束符


模式匹配::

    右匹配: %right
    左匹配: left%
    两边匹配: %center%
    匹配长度为2的: __ (2个下划线)
    其他扩展使用正则: REGEXP、NOT REGEXP

常用查询::

    MAX(column) --最大值



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





