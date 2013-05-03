.. _ssh_broken_pipe:

避免SSH连接因超时闲置断开
=============================

* 用SSH过程连接电脑时，经常遇到长时间不操作而被服务器踢出的情况，常见的提示如::

    Write failed: Broken pipe

* 这是因为如果有一段时间在SSH连接上无数据传输，连接就会断开。解决此问题有以下几种方法:

1. 修改 ``/etc/ssh/ssh_config`` 文件(可分在服务器端还是客户端)(需要root权限):

    * 在客户端设置, 添加如下一行(此后该系统里的用户连接SSH时，每60秒会发一个KeepAlive请求，避免被踢)::

         ServerAliveInterval 60

    * 在服务器端设置, 添加如下设置(应注意启用该功能后，安全性会有一定下降[比如忘记登出时……])::

        ClientAliveInterval 60


    * 注意，执行完上面修改后，需要重启sshd服务::

        service sshd reload 


2. 修改 ``~/.ssh/config`` 文件，在此文件中增加如下一句::

    ServerAliveInterval 60

保存退出，重新开启用户的shell，则再ssh远程服务器的时候，不会因为长时间操作断开。应该是加入这句之后，ssh客户端会每隔一段时间自动与ssh服务器通信一次，所以长时间操作不会断开。

3. 修改 ``/etc/profile`` 配置文件,增加::

    TMOUT=1800

这样30分钟没操作就自动LOGOUT

4. 利用expect 模拟键盘动作，在闲置时间之内模拟地给个键盘响应,将下列代码保存为xxx，然后用expect执行::

    #!/usr/bin/expect  
    set timeout 60  
    spawn ssh user@host   
          interact {          
            timeout 300 {send "\x20"}  
          } 
    expect xxx

接着按提示输入密码就可以了，这样每隔300秒就会自动打一个空格(\x20)，具体的时间间隔可以根据具体情况设置。

5. 如果你在windows下通过工具连接，可以设置为
secureCRT：选项---终端---反空闲 中设置每隔多少秒发送一个字符串，或者是NO-OP协议包
putty：putty -> Connection -> Seconds between keepalives ( 0 to turn off ), 默认为0, 改为300.



