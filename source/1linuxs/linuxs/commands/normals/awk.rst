.. _awk:

awk命令
###############
::

     #!/bin/awk -f

语法::

    awk [ -F re] [parameter...] ['prog'] [-f progfile][in_file...] 

说明::

    $0表示整个行(记录)
    //内置变量
    记录分隔符变量RS
    当前工作的记录数NR
    字段分隔符FS
    显示文件本文件<testAwk>中第3行到第6行,以字符%分隔的第一个字段,第三个字段
    awk -F % 'NR==3,NR==6 {printf $1  $3}' <testAwk>



awk的内置函数
^^^^^^^^^^^^^^^^^^^^^^
显示<testAwk>文件中行号与第1个字段::

    awk '{printf"%03d   %s\n",NR,$1}' <testAwk>

显示文本文件<mydoc>匹配（含有）字符串"sun"的所有行::

    awk '/sun/{print}' <mydoc>
    or
    awk '/sun/' <mydoc>   # 显示整个记录（全行）是awk的缺省动作

第一个匹配 ``Sun`` 或 ``sun`` 的行与第一个匹配 ``Moon`` 或 ``moon`` 的行之间的行，并显示到标准输出上::

    awk '/[Ss]un/,/[Mm]oon/ {print}' <myfile>

下面的示例显示了内置变量和内置函数length::

    awk 'length($0)>80 {print NR}' <myfile>


检查其中的passwd字段（第二字段）是否为"x",如不为"x", 则表示该用户没有设置密码::

    awk -F: '$2=="x" {printf "%s no password!\n", $1}' /etc/passwd

awk的流程控制
^^^^^^^^^^^^^^^^^^^^
BEGIN和END(``<fileName>`` 文件字段间用 ``:`` 分隔)::

    // 取出文件中的第三列字段, 并最終求和
    awk 'BEGIN \
    >{ FS=":";print "统计销售金额";total=0}
    >{print $3;total=total+$3;}
    >END
    >{printf "销售金额总计：%.2f",total}' <fileName>

流程控制语句::

    if..else
    while
    do-while
    for(<1>;<2>;<3>)

实例
^^^^^^^^^^

* 把字符串按空格分隔并取出第5列::

    echo $string | awk '{print $5}'

* 把字符串按 ``:`` 分隔并取出第3列::

    echo $string | awk -F: '{print $3}'

* 把字符串按 ``/`` 分隔并取出第3列和第5列并以"-"分隔::

    echo $string | awk -F '/' '{print $3"-"$4}'


实例
----------

* 取出用户列表::

    cat /etc/passwd | awk -F: '{print $1}'

* 分析nginx日志文件 ``access.log`` 获得访问前10位的ip地址::

    awk '{print $1}' access.log |sort|uniq -c|sort -nr|head -10


* for循环::

    awk 'BEGIN{for(i=1;i<=10;i++)print i;}'



其他小示例
^^^^^^^^^^^^^^^^^^^^^

打印所有以模式no或so开头的行::

    awk '/^(no|so)/' <fileName>

如果记录以n或s开头，就打印这个记录::

    awk '/^[ns]/{print $1}' <filename>

如果第一个域以两个数字结束就打印这个记录::

    awk '$1 ~/[0-9][0-9]$/{print $1} <filename>

如果第一个等于100或不等于50或者第二个域小于50，则打印该行::

    awk '$1 ==100 || $1 != 50 || $2 < 50' <filename>

如果记录包含正则表达式test，则第一个域加10并打印出来::

    awk '/test/{print $1 + 10}' <filename>

如果第一个域大于5则打印前面的表达式值, 否则打印后面的表达式值::

    awk '{print ($1 > 5 ? "ok "$1: "error"$1)}' <filename>

打印以正则表达式root开头的记录到以正则表达式mysql开头的记录范围内的所有记录::

    awk '/^root/,/^mysql/' <filename>


