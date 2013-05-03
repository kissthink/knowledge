.. _mysql_replication:

16. 复制
=============

:author: 新溪-gordon
:date: 2012-05-28

content:

.. toctree::
   :maxdepth: 2

   16replications/configure   

网站主页: http://dev.mysql.com/doc/refman/5.5/en/replication.html

* 复制是asynchronous——slave不需要一直连着master接收更新. 更新可能出现在long-distance连接甚至临时或间歇连接(如拨号服务). 根据配置的不同，你可以复制所有数据库或指定数据库或某数据库中的指定表

* 使用mysql replication的原因有::

    Scale-out solutions: 扩展解决方案，如主写分离(这种模型可以提高写的性能，而读的性能则可以通过增加slave的数量来实现)
    Data security: 数据安全(因数据已经复制到slave，slave可以暂停复制进程，然后运行备份服务而不用影响master上的数据)
    Analytics: 数据分析(数据的产生是在master上，slave可以在暂停复制进程，然后进行数据分析而不影响master)
    Long-distance data distribution(远程数据分布): 如果分支机构想使用主数据，可以通过复制给此分支机构以备份，而不用永久给他们master上的权限

* 在MySQL属性上只支持一种方式——异步复制(一台server做master，其余的为slave)。与此形成对比的是MySQL集群(``见17章MySQL集群``)的一个属性——同步复制
* 有好多可用的解决方案来設定两server间的复制，但最好的方法是根据当前的 **数据和引擎的类型** 来决定(``见16.1.1如何設定复制``)
* 复制的方法主要两类(``见16.1.2复制格式``)::

    Statement Based Replication (SBR)[默认格式]
    Row Based Replication (RBR)
    还有一种Mixed Based Replication(MBR)

* 复制通过一系列的不同的选项和变量进行控制!这些选项和变量控制着核心操作中的“复制”、超时、哪些数据库和过滤信息(``见16.1.3 复制与二进制选项和变量``)
* 可以通过复制解决一系列不同的问题——如性能问题、不同DB的备份、还可以作为减少系统失败大解决方案的一部分(``见16.3 复制解决方案``)
* 不同数据类型和語句在复制时如何处理的脚注(包含复制属性、版本兼容、升级、问题及处理方案，包含FAQ(``见 16.4 复制脚注``))
* “复制”实现的细节信息，复制的实现，二进制日志进程和内容，語句如何记录和复制后台线程和规则(``见16.2 复制的实现``)




