.. _curl:

curl命令简析
=================
常见用法::

    -v: 调试时用



用法: curl [选项...] <url>
注意:

    curl中数据为json时, 最好都用双引号,里面用 ``\"`` 进行转义

选项: 

      * (H) 指只适用于http/https
      * (F)指只适用于ftp

.. option:: -a/--append

   Append to target file when uploading (F)

.. option:: -A/--user-agent

   <string> User-Agent to send to server (H)

.. option:: --anyauth

   Pick "any" authentication method (H)

.. option:: -b/--cookie

   <name=string/file> Cookie string or file to read cookies from (H)

.. option:: -d, --data <data>

* 时间相关:

.. option:: -m/--max-time <seconds>

   整个过程中要花费的最长时间(秒), 防止因网络慢或链接失效(参考:--connect-timeout).

.. option:: --connect-timeout <seconds>

   允许到

.. option:: -I/--head

   (HTTP/FTP/FILE)只获取http头！当使用FTP or FILE文件,curl只显示文件大小和最后修改时间

.. option:: -s/--silent

   静默模式！不显示进度条和错误显示！

.. option:: -o/--output <file>

   把输入改为写入到指定文件(默认是 ``stdout`` )::

       curl http://{one,two}.site.com -o "file_#1.txt"
       curl http://{site,host}.host[1-5].com -o "#1_#2"

.. option:: -O/--remote-name

   Write output to a local file named like the remote file we get. (Only the file part of the remote file is used, the path is cut off.)::

       curl -O http://<url>/<file>.tar.gz  (类型wget?)

.. option:: -L/--location

   (HTTP/HTTPS) If the server reports that the requested page has moved to a different location (indicated with a Location: header and a 3XX  response  code),  this  option will make curl redo the request on the new place.(php等动态语言的文件需要加L才能下载下来)


.. warning::

   为啥有的时候要对url地址加入到双引号中?





.. _curl_example:

curl命令实例
--------------------

要全部显示，请加参数 -i，要只显示头部，用参数 -I。任何时候，可以使用 -v 命令看curl是怎样工作的，它向服务器发送的所有命令都会显示出来。为了断点续传，可以使用-r参数来指定传输范围。

* GET method::

    curl www.hotmail.com/when/junk.cgi?birthyear=1905&press=OK

* POST method::

    curl -d "birthyear=1905&press=OK" www.hotmail.com/when/junk.cgi

* 新的POST method(将本地的文件用POST上传到服务器)::

    curl -F upload=@localfilename -F press=OK URL

* 使用PUT::

    curl -T uploadfile www.uploadhttp.com/receive.cgi

* 有关认证(参数中指定用户名而空着密码，curl可以交互式的让用户输入密码)::

    curl -U proxyuser:proxypassword http://curl.haxx.se

* referer 引用::

    curl -e Url1 Url2

* 指定用户端::

    curl -A "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)" URL
    // ipad safari
    curl -A "Mozilla/5.0 (iPad; CPU OS 7_1_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D201 Safari/9537.53" <URL>
    // iphone 5c weixin
    "Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B440 MicroMessenger/6.0.2 NetType/WIFI"
    // 华为 微信
    "Mozilla/5.0 (Linux; U; Android 4.2.2; zh-cn; HUAWEI G716-L070 Build/HuaweiG716-L070) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30 MicroMessenger/6.0.0.54_r849063.501 NetType/WIFI"
    // 华为 内置浏览器
    "Mozilla/5.0 (Linux; U; Android 4.2.2; zh-cn; HuaweiG716-L070_LTE Build/HuaweiG716-L070_LTE) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30"
    
* COOKIES::

    curl -b cookies.txt -c newcookies.txt www.cookiesite.com

* 加密HTTP::

    curl https://that.secure.server.com

* json請求的語法::

    curl http://192.168.10.102:8000/tongji/baseinfo -H "Accept:application/json"
    curl http://192.168.10.102:8022/tongji/baseinfo -H "Accept:application/json" -d "rid=\"rid\"&sim=\"sim\"&mac=\"mac\"&imei=\"imei\"&device=\"device\"\&&resolution=\"resolution\"&os=\"android\"&&osversion=\"osversion\"&&timestamp=\"431432143214\""   

* ``multipart/form-data`` 类型请求::

    // 这种是正式的
    // http.content_type: multipart/form-data; boundary=----------------------------8ed7c16ae35a
    // 多个form间用boundary关联，多个form使用同一个boundary
    curl -v http://127.0.0.1:9090/addservice -include --form key=1122-3434 --form destName=hello.test.unit --form upload=@/tmp/localfile
    // 指定boundary的例子@undo
    curl -X POST -H "Content-Type: multipart/form-data; boundary=----------------------------4ebf00fbcf09" -d $'------------------------------4ebf00fbcf09\r\nContent-Disposition: form-data; name="example"\r\n\r\ntest\r\n------------------------------4ebf00fbcf09--\r\n' http://localhost:3000/test

    //指定文件类型@undo
    curl -H "Content-Type: multipart/related" \
    --form "data=@example.jpg;type=image/jpeg" http://localhost:3000/test


    // 指定为multipart/form但没有
    curl -v -XPOST -H 'Content-Type: multipart/form-data' http://192.168.35.141:9090/addservice?key=1122-3434&destName=hello.test.unit&zkidc=qa



翻墙相关::

    // -x, --proxy <[protocol://][user:password@]proxyhost[:port]>
    // 默认为http协议
    curl -x socks5://192.168.14.40:6500 "http://www.youtube.com"   // 要注意dns混乱问题







