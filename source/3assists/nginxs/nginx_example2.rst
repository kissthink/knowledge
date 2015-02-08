nginx实例2
###################

在nginx日志中显示post的请求参数::

    log_format access '$remote_addr - $remote_user [$time_local] \
        "$request" $status $body_bytes_sent $request_body \
        "$http_referer" "$http_user_agent" $http_x_forwarded_for';
    access_log logs/test.access.log access;


$http_user_agent::

  // ipad:
  Mozilla/5.0 (iPad; CPU OS 7_1_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D201 Safari/9537.53
  // iphone:
  Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B440 Safari/600.1.4
  // ipod:
  Mozilla/5.0 (iPod; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B410 Safari/600.1.4
