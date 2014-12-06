.. _mysql_command:

基本命令与实例
=======================

shell操作mysql命令
-------------------
::

    mysql -umysql -psa
    mysqladmin -u root -p shutdown

数据库级操作
---------------
::

    create database <database>;       //新建一个名为mydb的数据库
    drop database <database>          //删除一个名为mydb的数据库
    show databases          //查看数据库列表
    use databaseName;           //切换到指定数据库

    drop database [database name];  //删除数据库
    drop table [table name];    //删除数据表

    show columns from [table name]; //查看数据表各字段信息

表级操作
------------
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
----------------
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
-------------
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

        //索引相关
        // 选择使用索引"PRI和ziduan1_index"
        select * from table USE index(PRI,ziduan1_index) limit 2;
        // 强制使用索引"PRI和ziduan1_index"
        select * from table force index(PRI,ziduan1_index) limit 2;
        // 禁止使用索引"PRI,ziduan1_index"
        select * from table ignore index(PRI,ziduan1_index) limit 2;

        //特殊处理——消重、排序
        SELECT DISTINCT [column name] FROM [table name];//得到結果并消重
        SELECT [col1],[col2] FROM [table name] ORDER BY [col1, col2] DESC;//对結果按降序排列(升序用ASC)

        //一些常用内置函数
        SELECT COUNT(*) FROM [table name];//得到记录的得条数
        SELECT SUM([column name]) FROM [table name];//得到这列所有数的和.注:此列为数字

    * 连表查询::

        // example 1
        select * from (
          select <column> count(<column> as <column2> 
          from <tab> group by <column>
        ) as <tab2>
        where <tab2>.<column>=<???>

        // example 2
        SELECT * FROM <tab1> LEFT JOIN <tab2> ON <tab1>.<field1> = <tab2>.<field2>



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
------------
::

    update [tabName] set [field name]=[field value] where [field2 name]=[field2 value]

insert命令
-----------
::

    insert into <DB>.<Table> values (<value1>, <value2>, ...);
    INSERT INTO <tbl_name> (<col1>, <col2>) VALUES(15,col1*2); 

    insert into <DB>.<table> (<col1>, <col2>)
        select <column1>, <column2>
        from <table2>
        where ...
    ;

    INSERT INTO <DB>.<TABLE> SELECT 1, REPEAT('a', 7);

delete命令
---------------
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

    // 索引某一些字段 
    ALTER TABLE <tab> ADD KEY <indexName> (<column>(<Num>));  // 索引前<Num>长度的字段


    //删除索引
    DROP INDEX <index_name> ON <tableName>;    //删除索引的语法
    ALTER TABLE <tab> DROP INDEX  <index_name>
    ALTER TABLE <tab> DROP PRIMARY KEY <key>

    //查看索引
    SHOW INDEX FROM <TAB>
    
* mysql一次只使用一个索引来优化sql语句


事件调度器
-------------
* 基本操作::

    // 查看是否已开启事件调度器
    SHOW VARIABLES LIKE 'event_scheduler';
    或
    SELECT @@event_scheduler;
    或
    SHOW PROCESSLIST;

    // 设定事件调度器
    SET GLOBAL event_scheduler = 1;
    SET GLOBAL event_scheduler = ON;

    // 查看
    SHOW EVENTS;
    // 查看具体事件
    SHOW CREATE EVENT <eventName>;

* 创建语法::

    CREATE EVENT [IF NOT EXISTS] event_name
    ON SCHEDULE <schedule>
    [ON COMPLETION [NOT] PRESERVE]
    [ENABLE | DISABLE]
    [COMMENT 'comment']
    DO sql_statement;

    <schedule>:
    AT TIMESTAMP [+ INTERVAL INTERVAL]    // 多长时间后执行
    | EVERY INTERVAL [STARTS TIMESTAMP] [ENDS TIMESTAMP]    // 在设定时间内,每隔多长时间执行一次

    INTERVAL:
    quantity {YEAR | QUARTER | MONTH | DAY | HOUR | MINUTE |
            WEEK | SECOND | YEAR_MONTH | DAY_HOUR | DAY_MINUTE |
            DAY_SECOND | HOUR_MINUTE | HOUR_SECOND | MINUTE_SECOND}

* 实例(每秒插入一条记录)::

    CREATE EVENT e_test_insert
    ON SCHEDULE EVERY 1 SECOND 
    COMMENT '测试事件调试'
    DO INSERT INTO <db>.<table> VALUES (<id>, <name>);

* 实例(5天后清空test.aaa表)::

    CREATE EVENT e_test
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 5 DAY
    DO TRUNCATE TABLE test.aaa;

* 修改事件(ALTER EVENT)::

    ALTER EVENT event_name
    [ON SCHEDULE schedule]
    [RENAME TO new_event_name]
    [ON COMPLETION [NOT] PRESERVE]
    [COMMENT 'comment']
    [ENABLE | DISABLE]
    [DO sql_statement]

    临时关闭事件
    ALTER EVENT e_test DISABLE;
    开启事件
    ALTER EVENT e_test ENABLE;
    将每天清空test表改为5天清空一次：
    ALTER EVENT e_test
    ON SCHEDULE EVERY 5 DAY;

* 删除事件(DROP EVENT)::

    DROP EVENT [IF EXISTS] event_name

存储过程相关
-----------------
::

    //一.创建存储过程
    create procedure sp_name()
    begin
    .........
    end

    //二.调用存储过程
    call sp_name()
    注意：存储过程名称后面必须加括号，哪怕该存储过程没有参数传递

    三.删除存储过程
    drop procedure sp_name//

    不能在一个存储过程中删除另一个存储过程，只能调用另一个存储过程

    四.其他常用命令
    1.show procedure status
    2.show create procedure sp_name

    创建带参数的存储过程
    CREATE PROCUDURE productpricing(  
      OUT p1 DECIMAL(8,2),  
      OUT ph DECIMAL(8,2),  
      OUT pa DECIMAL(8,2)  
    )
    BEGIN  
      SELECT Min(prod_price) INTO pl FROM products;  
      SELECT Max(prod_price) INTO ph FROM products;   
      SELECT Avg(prod_price) INTO pa FROM products;  
    END; 
    //DECIMAL用于指定参数的数据类型
    //OUT用于表明此值是用于从存储过程里输出的
    //MySQL支持 OUT, IN, INOUT

    //调用带参数的存储过程：
    CALL　productpricing(@pricelow, @pricehigh, @priceaverage);  
    //所有的参数必须以@开头
    //想获取@priceaverage等的值
    SELECT @priceaverage, @pricelow, @priceaverage;

    // 另一个带IN和OUT参数的存储过程
    CREATE PROCEDURE ordertotal(  
      IN onumber INT,  
      OUT ototal DECIMAL(8,2)  
    )  
    BEGIN  
      SELECT Sum(item_price*quantity)  
      FROM orderitems  
      WHERE order_num = onumber 
      INTO ototal;  
    END;  
    // 调用方法
    CALL ordertotal(20005, @total);  
    SELECT @total;  

锁相关
-------------
::

   // 特殊操作
   select * from <TAB> where <COL> > 0 for update;  // 加读锁(X锁)
   select * from <TAB> where <COL> > 0 lock in share mode;   // 加S锁

   tx_isolation: 事务的隔离级别
   1. read-uncommitted, 2. repleatable-read(默认) 3. read-committed
   select @@tx_isolation; //查询
   set @@tx_isolation='read-uncommitted';  //设定值

外键
-------

::

    FOREIGN KEY( <key_name> ) REFERENCES <tableName> (<paramName>)
    -- example
    create table <tab1> (
       <col1> int,
       foreign key(<col1>) references <tab2>(<tabCol2>)
    ) engine=innodb;


    InnoDB支持外键
    MyISAM不支持外键


优化相关
-----------------
::

    Show命令
    慢查询日志


    1. explain分析查询
    explain <sql>;  -- SQL语句的查询执行计划(QEP)。这条命令的输出结果能够让我们了解MySQL 优化器是如何执行sql语句的
    analyze table <tab>;   //

    2. profiling分析查询
    mysql> SET profiling = 1;
    mysql> xxxxx(sql语句);
    mysql> SHOW PROFILES\G


    MySQL数据库是常见的两个瓶颈是CPU和I/O的瓶颈, 如果应用分布在网络上，那么查询量相当大的时候那么平瓶颈就会出现在网络上


* EXPLAIN字段::

    ØTable：显示这一行的数据是关于哪张表的
    Øpossible_keys：显示可能应用在这张表中的索引。如果为空，没有可能的索引。可以为相关的域从WHERE语句中选择一个合适的语句
    Økey：实际使用的索引。如果为NULL，则没有使用索引。MYSQL很少会选择优化不足的索引，此时可以在SELECT语句中使用USE INDEX（index）来强制使用一个索引或者用IGNORE INDEX（index）来强制忽略索引
    Økey_len：使用的索引的长度。在不损失精确性的情况下，长度越短越好
    Øref：显示索引的哪一列被使用了，如果可能的话，是一个常数
    Ørows：MySQL认为必须检索的用来返回请求数据的行数
    Øtype：这是最重要的字段之一，显示查询使用了何种类型。从最好到最差的连接类型为system、const、eq_reg、ref、range、index和ALL

    system > const > eq_ref > ref > fulltext > ref_or_null > index_merge
        > unique_subquery > index_subquery > range > index > ALL

        nsystem、const：可以将查询的变量转为常量.  如id=1; id为 主键或唯一键.
        neq_ref：访问索引,返回某单一行的数据.(通常在联接时出现，查询使用的索引为主键或惟一键)
        nref：访问索引,返回某个值的数据.(可以返回多行) 通常使用=时发生
        nrange：这个连接类型使用索引返回一个范围中的行，比如使用>或<查找东西，并且该字段上建有索引时发生的情况(注:不一定好于index)
        nindex：以索引的顺序进行全表扫描，优点是不用排序,缺点是还要全表扫描
        nALL：全表扫描，应该尽量避免

    ØExtra：关于MYSQL如何解析查询的额外信息，主要有以下几种

        nusing index：只用到索引,可以避免访问表. 
        nusing where：使用到where来过虑数据. 不是所有的where clause都要显示using where. 如以=方式访问索引.
        nusing tmporary：用到临时表
        nusing filesort：用到额外的排序. (当使用order by v1,而没用到索引时,就会使用额外的排序)
        nrange checked for eache record(index map:N)：没有好的索引.


profiling分析查询
----------------------

::

    select @@profiling;
    //以下为使用方法
    set profiling = 1;
    xxxxx   // sql操作
    show profiles\G
    set profiling = 0; // 关闭操作


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

其他命令
------------
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





