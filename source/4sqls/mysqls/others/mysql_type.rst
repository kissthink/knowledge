.. _mysql_timetype:

时间类型
=========

    .. csv-table:: 表1 MySQL日期数据类型
       :widths: 10, 10, 30, 50
       :header: 日期类型, 存储空间, 日期格式, 日期范围

           datetime, 8 bytes, YYYY-MM-DD HH:MM:SS, 1000-01-01 00:00:00 ~ 9999-12-31 23:59:59
           timestamp, 4 bytes, YYYY-MM-DD HH:MM:SS, 1970-01-01 00:00:01 ~ 2038-12-31 23:59:59
           date, 3 bytes, YYYY-MM-DD, 1000-01-01 ~ 9999-12-31
           year, 1 bytes, YYYY, 1901 ~ 2155


timestamp
----------

* timestamp值可以从1970的某时的开始一直到2037年，精度为一秒，其值作为数字显示。
* timestamp值显示尺寸的格式如下表所示：

    +---------------+----------------+
    | 列类型        | 显示格式       |
    +===============+================+
    | timestamp(14) | yyyymmddhhmmss |
    +---------------+----------------+
    | timestamp(12) | yymmddhhmmss   |
    +---------------+----------------+
    | timestamp(10) | yymmddhhmm     |
    +---------------+----------------+
    | timestamp(8)  | yyyymmdd       |
    +---------------+----------------+
    | timestamp(6)  | yymmdd         |
    +---------------+----------------+
    | timestamp(4)  | yymm           |
    +---------------+----------------+
    | timestamp(2)  | yy             |
    +---------------+----------------+

* 最常见的显示尺寸是6、8、12、和14. 
* 你可以在创建表时指定一个任意的显示尺寸，但是定义列长为0或比14大均会被强制定义为列长14。
* 列长在从1～13范围的奇数值尺寸均被强制为下一个更大的偶数,如:

    .. csv-table:: 表1 强制字段长度
       :widths: 50 50
       :header: 定义字段长度, 强制字段长度

           timestamp(0), timestamp(14)
           timestamp(15), timestamp(14)
           timestamp(1), timestamp(2)
           timestamp(5), timestamp(6)

* 所有的timestamp列都有同样的存储大小
* 使用被指定的时期时间值的完整精度（14位）存储合法的值不考虑显示尺寸
* 不合法的日期，将会被强制为0存储
