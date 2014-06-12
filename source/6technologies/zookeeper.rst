zookeeper命令
========================

默认配置文件 ``conf/zoo.cfg``::

   tickTime=2000     # basic time unit(2000ms)
   dataDir=/var/lib/zookeeper    
   clientPort=2181


replicated mode配置文件::

    tickTime=2000
    dataDir=/var/lib/zookeeper
    clientPort=2181
    initLimit=5    # 单元是基于tickTime的
    syncLimit=2    # 2*2000ms=4000ms
    server.1=<zoo1>:2888:3888
    server.2=<zoo2>:2888:3888
    server.3=<zoo3>:2888:3888






命令使用::

    bin/zkServer.sh start   //启动server
    // client
    bin/zkCli.sh -server 127.0.0.1:2181   // java
    ./cli_mt 127.0.0.1:2181    // c

    // 命令使用
    zk> help
    zk> ls /
    zk> create /<nodeName> <value>
    zk> get /<nodeName>  
    zk> set /<nodeName> <value>
    zk> delete /<nodeName>






