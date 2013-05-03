.. _nginx_question:

NginX问题汇总
==================

nginx 502 bad gateway
--------------------------------
* 查看错误日志(``cat log/nginx/error.log``)::

    upstream sent too big header while reading response header from upstream

* php-cgi进程数不够用、php执行时间长、或者是php-cgi进程死掉，都会出现502错误


* 查看当前的php-fpm进程数是否够用(如果实际使用的“FastCGI进程数”接近预设的“FastCGI进程数”，那么，说明“FastCGI进程数”不够用，需要增大)::

    netstat -anpo | grep "php-fpm" | wc -l

* 部分PHP程序的执行时间超过了Nginx的等待时间，可以适当增加nginx.conf配置文件中FastCGI的timeout时间，例如::

    ......
    http 
    {
        ......
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
        ......
        fastcgi_buffer_size 128k;
        fastcgi_buffers 8 128k;

    }
    ....

* 头部太大::

    proxy_buffer_size 128k;
    proxy_buffers   32 32k;
    proxy_busy_buffers_size 128k;

* https转发配置错误::

    server_name www.mydomain.com;
    location /myproj/repos {
      set $fixed_destination $http_destination;
      if ( $http_destination ~* ^https(.*)$ )
      {
        set $fixed_destination http$1;
      }
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header Destination $fixed_destination;
      proxy_pass http://subversion_hosts;
    }

PS:
如果报的是400错误，就增大header_buffers值为32k（默认为4k）
large_client_header_buffers 4 32k;



upstream sent too big header while reading response header from upstream
------------------------------------------------------------------------------------

* 如果是代理的话在http段增加::

    proxy_buffers 8 16k;
    proxy_buffer_size 32k;

* 如果是fastcgi的话::

    fastcgi_buffers 8 16k;
    fastcgi_buffer_size 32k;


