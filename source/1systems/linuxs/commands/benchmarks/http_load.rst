.. _http_load:

http_load命令使用方法
=========================

* 安装:

    下载安装，安装地址自己查

* 命令格式::

    http_load -p 并发访问进程数 -s 访问时间 需要访问的URL文件

* 参数说明::

    * -parallel (-p): 并发的用户进程数
    * -fetches (-f): 总计的访问次数
    * -rate (-r): 每秒的访问频率
    * -seconds (-s): 总计的访问时间

* 实例::

    ./http_load -rate 5 -seconds 10 urllist.txt

* 实例说明:

    * 执行一个持续时间为10秒的测试，每秒频率为5
    * urllist.txt中内容为::

        http://bbs.programfan.info/abc/test1.html
        http://bbs.programfan.info/abc/test2.html
        http://bbs.programfan.info/abc/test3.html

* 結果::

    49 fetches, 2 max parallel, 289884 bytes, in 10.0148 seconds
    5916 mean bytes/connection, 
    4.89274 fetches/sec, 28945.5 bytes/sec
    msecs/connect: 28.8932 mean, 44.243 max, 24.488 min
    msecs/first-response: 63.5362 mean, 81.624 max, 57.803 min
    HTTP response codes: code 200 — 49 

* 結果说明:

    1. 49 fetches, 2 max parallel, 289884 bytes, in 10.0148 seconds
        说明在上面的测试中运行了49个请求，最大的并发进程数是2，总计传输的数据是289884bytes，运行的时间是10.0148 秒
    2. 5916 mean bytes/connection
        说明每一连接平均传输的数据量289884/49=5916
    3. 4.89274 fetches/sec, 28945.5 bytes/sec
        说明每秒的响应请求为4.89274，每秒传递的数据为28945.5 bytes/sec
    4. msecs/connect: 28.8932 mean, 44.243 max, 24.488 min
        说明每连接的平均响应时间是28.8932 msecs，最大的响应时间44.243 msecs，最小的响应时间24.488 msecs
    5. msecs/first-response: 63.5362 mean, 81.624 max, 57.803 min
    6. HTTP response codes: code 200 — 49
        说明打开响应页面的类型，如果403的类型过多，那可能

* 特殊说明:

    测试结果中主要的指标是 fetches/sec、msecs/connect 这个选项，即服务器每秒能够响应的查询次数！


