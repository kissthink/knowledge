supervisor命令
==================

::

    apt-get install supervisor  
    yum install supervisor

每个进程的配置文件都可以单独分拆，放在 ``/etc/supervisor/conf.d/`` 目录下，以 ``.conf`` 作为扩展名,以 ``app.conf`` 为例::

    [program:app]  
    command=/usr/bin/gunicorn -w 1 wsgiapp:application  
    directory=/srv/www  
    user=www-data  

重启supervisor，让配置文件生效::

    supervisorctl start app  
    supervisorctl stop app 

如果要在命令行中使用变量，就需要自己先编写一个shell脚本::

    #!/bin/sh  
    /usr/bin/gunicorn -w `grep -c ^processor /proc/cpuinfo` wsgiapp:application  


