partition分区表相关
==============================

range分区创建实例::

  create table <tab> (
     c1 int auto_increment primary key,
     c2 varchar(30) default "",
     c3 date default "2000-01-01"
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8
  PARTITION BY RANGE (to_days(c3))
  (
     PARTITION p1 VALUES LESS THAN (to_days('2014-09-01')),
     PARTITION p2 VALUES LESS THAN (to_days('2014-10-01')),
     PARTITION p3 VALUES LESS THAN (to_days('2014-11-01')),
     PARTITION p11 VALUES LESS THAN MAXVALUE
  )

增加分区::

  alter table <tab>
     add partition (partition <p4> values less than (to_days('2014-12-01')))

删除分区::

  alter table <tab> drop partition <p4>    --删除分区，则分区的数据也删除
     

List分区创建::

  CREATE TABLE m (
  a INT,
  b INT)ENGINE=innnodb
  PARTITION BY LIST (b)(
  PARTITION p0 VALUES IN (1,2,3,4,5),
  PARTITION p1 VALUES IN (6,7,8,9,10));

  -- 插入的值(3,11)不符合
  -- 如果是innodb引擎,后面(4,9)符合条件不会插入表中，
  -- 如果是myisam引擎,后面(4,9)符合条件则会插入表中
  insert into m values (1,6),(2,7),(3,11),(4,9)

Hash分区创建::

  CREATE TABLE m_hash (
    a INT,
    b DATETIME
  )ENGINE=innnodb
  PARTITION BY HASH (YEAR(b))    --"partition by hash (expr)" expr是一个返回整数的表达式
  PARTITIONS 4;     --表示要被分割成分区的数量，没有则默认是1

  -- 加入分区的算法mod(expr,分区数量4)=0 则加入p0
  PARTITION BY LINEAR HASH (YEAR(b))
  --与hash只是算法不同，返回是值是一样的

COLUMNS分区::

  CREATE TABLE t_columns_range(
    a INT,
    b DATETIME
  ) ENGINE=INNODB
  PARTITION BY RANGE COLUMNS (b) --也可以PARTITION BY LESS COLUMNS (b)
  (
     PARTITION p0 VALUES LESS THAN('2009-01-01'),
     PARTITION p1 VALUES LESS THAN('2010-01-01')
  );


分析分区情况::

  explain partitions
      select count(*) from part_date3
      where c3> date '2014-01-01' and c3 <date '2014-10-31'\G

查看分区情况::

  select * from information_schema.partitions where table_name='<tabname>';
  
