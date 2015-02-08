.. _nginx_summary:

Nginx知识汇总
########################

客户端类型
---------------------

常见agent::

  // 华为微信浏览器
  Mozilla/5.0 (Linux; U; Android 4.2.2; zh-cn; HUAWEI G716-L070 Build/HuaweiG716-L070) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025410 Mobile Safari/533.1 MicroMessenger/6.1.0.57_r1024329.540 NetType/cmnet
  // iphone微信浏览器
  Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D257 MicroMessenger/6.1 NetType/WIFI
  // 华为默认浏览器
  Mozilla/5.0 (Linux; U; Android 4.2.2; zh-cn; HuaweiG716-L070_LTE Build/HuaweiG716-L070_LTE) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30
  

::

    if ( $http_user_agent ~ iPhone ) {
       rewrite ^.*$ http://ios.747.cn redirect;
    } 

php代码::

    $agent = $_SERVER['HTTP_USER_AGENT'];
    if(strpos($agent,"NetFront") || strpos($agent,"iPhone")
       || strpos($agent,"MIDP-2.0") || strpos($agent,"Opera Mini")
       || strpos($agent,"UCWEB") || strpos($agent,"Android")
       || strpos($agent,"Windows CE") || strpos($agent,"SymbianOS"))
    header("Location:http://online.747.cn/747/");

用wap上网::

    if(strstr($_SERVER['HTTP_ACCEPT'],'vnd.wap'))
    {
        header("Location:http://m.747.cn/x");
    }



用于打开portal页面的打开页面::


    // 可以使用baidu(因为是动态页面), 但m.747.cn是静态页面
    // 当然如果使用浏览器,可能也可以打开这个页面,但那是因浏览器内部做了操作
    location ~ /?timestamp=d+ {
        rewrite ^(/timestamp=d+)$ http://m.747.cn/ permanent;
    }




跳转与代理的区别
-----------------------

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




