.. _goal_overview:

知识点汇总
###################

PBX: Private Branch Exchange，用户级交换机

Linux相关
=============
* Linux运维趋势

    http://os.51cto.com/art/201011/233915.htm

* chkrootkit:

    * Linux 主機上的木馬檢查工具
    * chkrootkit 官方網站 http://www.chkrootkit.org
    * 執行 apt-get install chkrootkit
    * 安裝好之後，執行 chkrootkit 就會開始掃描了。

* arch操作系统:

    https://wiki.archlinux.org

Erlang相关
=================
* `thrift: <http://thrift.apache.org/>`_: a remote procedure call framework developped at Facebook for "scalable cross-languages services development".
* distel: Distributed Emacs Lisp for Erlang.

* plists: An Erlang module for doing list operations in parallel

* eper: a loose collection of Erlang Performance related tools

  * sherk - a profiler, similar to Linux oprofile or MacOs shark
  * gperf - a graphical performance monitor; shows CPU, memory and network usage
  * dtop  - similar to unix top
  * redbug- similar to the OTP dbg application, but safer, better etc.

* giza: a erlang client library for the Sphinx search engine (http://www.sphinxsearch.com). It speaks Sphinx's binary searchd protocol natively.

* Erlsom: an Erlang library to parse (and generate) XML documents. Erlsom can be used in a couple of very different modes

* redis的erlang客户端

    * git://github.com/wooga/eredis.git(redis官方推荐)
    * git://github.com/japerk/erldis.git(正用中...)
    * git://github.com/litaocheng/erl-redis.git


JS相关
==============
* QWrap -- 百度有啊前端团队推出的一个javascript框架
* EJS -- typically used by loading a template and rendering it with data
* mustache -- Logic-less templates
* zeptojs -- Zepto is a minimalist JavaScript library for modern browsers with a largely jQuery-compatible API.(直接将ie拒之外)

* backbone

    * git://github.com/addyosmani/backbone-fundamentals.git
    * http://backbonetutorials.com/
    * http://documentcloud.github.com/backbone/
    * 实例:git://github.com/thomasdavis/backbonetutorials.git
    * underscorejs -- http://underscorejs.org/

    * http://liquidmedia.ca/blog/2011/01/backbone-js-part-1/
    * http://coenraets.org/blog/2012/02/sample-app-with-backbone-js-and-twitter-bootstrap/



其他
============

* Webdis:an HTTP interface for Redis with JSON output(webd.is)


* Gitolite: 是一款Perl 语言开发的Git 服务管理工具，通过公钥对用户进行认证，并能够通过配置文件对写操作进行基于分支和路径的的精细授权


* Log4j:Apache的一个开放源代码项目，通过使用Log4j，我们可以控制日志信息输送的目的地是控制台、文件、GUI组件、甚至是套接口

* `Twisted <http://twistedmatrix.com/>`_ is an event-driven networking engine written in Python and licensed under the open source

* scrapy——写的爬虫系统   pythongit://github.com/scrapy/scrapy.git
* `valgrind——An instrumention framework for building dynamic analysis tools <http://valgrind.org/>`_




简介
=========
* `vagrant <http://www.vagrantup.com>`_: 虚拟机
* `tmux <http://tmux.sourceforge.net/>`_: 来自OpenBSD的优秀终端复用软件，类似GNU Screen, 
* cassandra: 一个分散的结构化存储系统
* 什麼是 dotfile 呢？dotfile 就是你的那些 dot 開頭的檔案，譬如說 .vim .vimrc .emacs.d .bashrc
* `Winpdb <http://winpdb.org>`_ - A platform independent Python debugger
* xterm 是一个X Window System上的标准虚拟终端。用户可以在同一个显示器上开启许多xterm，每一个都为其中运行的进程提供独立的输入输出(一般来说此进程是Unix shell)
* CFLAGS and CXXFLAGS are the name of environment viriables or of Makefile virables that can be set to specify switches to be passed to a compiler in the process of building compute software.
* SPDY 是 Google 开发的基于传输控制协议 (TCP) 的应用层协议 ，开发组正在推动 SPDY 成为正式标准（现为互联网草案）。SPDY 协议旨在通过压缩、多路复用和优先级来缩短网页的加载时间和提高安全性。（SPDY 是 Speedy 的昵音，意思是更快）
* `netcraft <http://www.netcraft.com/>`_ 查看域名对应网站的操作系统、web服务器等资料
* `ZooKeeper <http://zookeeper.apache.org>`_ 是Hadoop的正式子项目，它是一个针对大型分布式系统的可靠协调系统，提供的功能包括：配置维护、名字服务、分布式同步、组服务等。ZooKeeper的目标就是封装好复杂易出错的关键服务，将简单易用的接口和性能高效、功能稳定的系统提供给用户。
* XA(X/Open), 必须首先了解分布式事务处理（Distributed Transaction Processing，DTP）的概念. 





其他
=============
* 负载均衡: 硬件(F5 BIG-IP, Citrix Netscaler), 软件(LVS, Nginx, HA-Proxy), 高可用软件(Heartbeat, Keeplived), 成熟的Linux集群架构有(LVS+Keepalived, Nginx+Keepalived, DRBD+Heartbeat)




