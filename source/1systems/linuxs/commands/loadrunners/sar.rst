sar命令
============
::

   //日志目录
   /var/log/sysstat/

   $sar -f /var/log/sysstat/sa28 \| head sar -r -f   // 追溯过去的统计数据
   

   //查看平均负载
   sar -q 1 10
   //查看内存使用状况
   sar -r 1 10
   //查看页面交换发生状况
   sar -W 1 10



