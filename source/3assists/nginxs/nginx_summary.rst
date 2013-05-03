.. _nginx_summary:

Nginx知识汇总
########################

跳转与代理的区别
=======================

代理
-------
::

    location / {
        proxy_pass http://<proxy url>;
    }

* 浏览器地址不变
* 每次請求原网址都会被代理到<proxy url>


跳转
--------
::

    if ($host = 'huoban.eqitong.com' ) {
       set $host_eqitong $1;
       rewrite ^(.*)$ http://<direct url>$1 permanent;
    }

* 最后一项参数flag标记有::

    last,       相当于apache的[L]标记
    break,      本条规则后匹配完成后，终止匹配
    redirect,   302临时重定向, 浏览器地址会显示跳转后的
    permanent   301永久重定向, 浏览器地址会显示跳转后的




