.. _php_question:

php问题汇总
##########################
connect() to ``unix:/var/run/php-fpm/php.sock failed (11: Resource temporarily unavailable)`` while connecting to upstream
------------------------------------------------------------------------------------------------------------------------------
::

   sock方式好像对php支持不好
   建议使用tcp方式
   The issue is socket itself, its problems on high-load cases is well-known.
   Please consider using TCP\IP connection instead of unix socket, for that you need to make these changes:
   replace listen = /var/run/php5-fpm.sock with listen = 127.0.0.1:9000
   ipc(sock)在highload下php的处理并不好


Fatal error: Allowed memory size of 134217728 bytes exhausted
----------------------------------------------------------------------

* 修改 ``php.ini`` (默认64M)::

    memory_limit = 1024M



一个php-fmp进程占很大内存不释放问题
------------------------------------------
一块大内存被php-fpm占用的原因:

* php-cgi不存在内存泄漏, 每个请求完成后php-cgi会回收内存, **但是不会释放给操作系统**
* 官方解决办法:

* 降低PHP_FCGI_MAX_REQUESTS的值, 对应php-fpm.conf中的max_requests(该值的意思是发送多少个请求后会重启该线程,需要适当降低这个值，让php-fpm自动的释放内存)
* 还有另一个跟它有关联的值max_children, 这个是每次php-fpm会建立多少个进程, 这样实际上的内存消耗是::

    max_children*max_requests*每个请求使用内存



* 检查php进程的内存占用，杀掉内存使用超额的进程::

    * * * * * /bin/bash /usr/local/script/kill_php_fpm.sh

* kill_php_fpm.sh脚本如下::

    #!/bin/sh
    # This script is used to kill php-cgi process that takes large memory size
    # If a php-cgi process uses 1% or more memory, then it will be killed.

    PIDS=`ps aux|grep php-fpm|grep -v grep|awk '{if($4>=1)print $2}'`

    for PID in $PIDS
    do
        #echo `date +%F....%T` >> /usr/local/php/logs/phpkill.log
        #echo $PID >> /usr/local/php/logs/phpkill.log
        kill -9  $PID
    done


