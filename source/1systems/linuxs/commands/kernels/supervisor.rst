supervisor命令
==================

安装::

    easy_install supervisor
    apt-get install supervisor  
    yum install supervisor

``supervisord`` 命令行参数::

    -c <file>, --configuration=<file>    指定配置文件
    -n, --nodaemon     Run supervisord in the foreground
    -u <user>, --user=<user>
    -d <path>, --directory=<path>   指定运行目录
    
``supervisorctl`` 命令行参数::

    -c, --configuration     // Configuration file path (default /etc/supervisord.conf)
    -s, --serverurl URL     // URL on which supervisord server is listening (default “http://localhost:9001”).
    -u, --username          //Username to use for authentication with server
    -p, --password          //Password to use for authentication with server


配置文件 ``-c`` 指定配置文件，否则::

    $CWD/supervisord.conf
    $CWD/etc/supervisord.conf
    /etc/supervisord.conf


每个进程的配置文件都可以单独分拆，放在 ``/etc/supervisor/conf.d/`` 目录下，以 ``.conf`` 作为扩展名,以 ``app.conf`` 为例:

    .. literalinclude:: ../../files/supervisord.conf
       :linenos:

重启supervisor，让配置文件生效::

    supervisorctl start app  
    supervisorctl stop app 

如果要在命令行中使用变量，就需要自己先编写一个shell脚本::

    #!/bin/sh  
    /usr/bin/gunicorn -w `grep -c ^processor /proc/cpuinfo` wsgiapp:application  


