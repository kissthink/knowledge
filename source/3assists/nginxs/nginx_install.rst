.. _nginx_install:

安装
=======


**安装前准备**
    * 问题一::

        ./configure: error: the HTTP rewrite module requires the PCRE library.

      解决:安装pcre-devel::

        yum -y install pcre-devel

    * 问题二::

        ./configure: error: the HTTP cache module requires md5 functionsfrom OpenSSL library. 
          You can either disable the module by using --without-http-cache option, 
          or install the OpenSSL library into the system, 
          or build the OpenSSL library statically from the source with nginx 
          by using --with-http_ssl_module --with-openssl=<path> options.

      解决::

        yum -y install openssl openssl-devel

**源码安装**
    * 源码下载后，解压，执行标准安装过程::

        ./configure --prefix=/usr/local/nginx
        make
        make install

    * 调试安装::

        ../configure --prefix=/usr/local/debug-nginx --with-debug

    * 为http服务开通https服务，并包含最重要的功能和模块，而与邮件相关的选项都被禁用::

        ./configure --prefix=/usr/local/nginx --with-http_ssl_module --with_http_module

    * 开启所有模块，由自己决定是否在运行时使用他们::

        ../configure --user=www-data --group=www-data /
                     --with-http_ssl_module --with-http_realip_module /
                     --with-http_addition_module --with-http_xslt_module /
                     --with-http_image_filter_module --with-http_geoip_module /
                     --with-http_sub_module --with-http_dav_module /
                     --with-http_flv_module --with-http_gzip_static_module /
                     --with-http_random_index_module --with-http_secure_link_module /
                     --with-http_stub_status_module

    * 邮件服务器代理::

        ./configure --user=www-data --group=www-data
                    --with-mail --with-mail_ssl_module
        // 如果愿意彻底禁用http服务功能，而只用Nginx用于邮件代理，可以添加 --without-http 选项




**配置nginx**

    * 增加日志目录::

        cd /var
        mkdir nginx; cd nginx
        mkdir log; mkdir run

    * 增加nginx配置文件::

        cd /etc
        cp /usr/local/nginx/sbin/nginx init.d/
        mkdir nginx; cd nginx; 
        mkdir sites-enabled global;
        cp /usr/local/nginx/conf/nginx.conf ./
        cp /usr/local/nginx/conf/mime.types ./
        cp /usr/local/nginx/conf/fastcgi_params ./

    * 修改配置文件/etc/nginx/fastcgi_params，在最上面增加如下一行::

        fastcgi_param  SCRIPT_FILENAME    $document_root$fastcgi_script_name;

    * 修改nginx配置文件nginx.conf::

        error_log /var/nginx/log/error.log;
        pid       /var/nginx/run/nginx.pid;
        events {
            worker_connections  1024;
        }
        http {
            include       /etc/nginx/mime.types;
            access_log    /var/nginx/log/access.log;

            sendfile        on;
            keepalive_timeout  65;

            include /etc/nginx/conf.d/*.conf;
            include /etc/nginx/sites-enabled/*.conf;
        }

    * 然后在目录 ``/etc/nginx/sites-enabled/`` 下新建文件，如新建一文件 ``bbs.conf`` ::

        server {
            listen      80;
            server_name wifionline.info;
            index index.html index.htm index.php;
            root /var/www/wifionline.info;

            location ~ .*\.(php|php5)?$ {
                fastcgi_pass 127.0.0.1:9000;
                fastcgi_index index.php;
                include fcgi.conf;
            }

            location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$ {
                expires 30d;
            }

            location ~ .*\.(js|css)?$ {
                expires 1h;
            }

            log_format wifionline '$remote_addr - $remote_user [$time_local]"$request" '
                  '$status $body_bytes_sent "$http_refer" '
                  '"$http_user_agent" $http_x_forwarded_for'
                  access_log /var/nginx/log/wifionline.info wifionline;
        }



**nginx使用**

    * 启动::

        /etc/init.d/nginx -c /etc/nginx/nginx.conf

    * 平滑重启::

        kill -HUP `/var/nginx/run/nginx.pid`







