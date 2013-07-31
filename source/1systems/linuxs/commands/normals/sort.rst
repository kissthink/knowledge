.. _sort:

sort命令使用
#####################
* 作用: sort [-o <输出文件>] [-t <分隔字符>] [+<起始字段> - <结束字段>] [文件] 对文本内容排序

* 命令::

    sort [-o <输出文件>] [-t <分隔字符>] [+<起始字段> - <结束字段>] [文件]


选项
---------
.. option:: -n, --numeric-sort

   compare according to string numerical value

.. option:: -r, --reverse

   反转




实例
---------

* 从小到大::

    sort

* 从大到小::

     sort -nr
