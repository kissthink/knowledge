.. _erlang_skill:

Erlang技巧
#################
::

    io:format("~n~s~n", [string:chars($-,72)]).


小工具::

    etop可以给进程排个名(memory, runtime, msg_q);
    pman显示所有进程列表,并能trace进程的函数调用到文件中;
    dbg进行trace,pattern trace更是方便的一塌糊涂;
    tv可以查看ets,mnesia表;
    percept可以绘制出进程并发统计图;
    dialyzer对代码进行静态分析;
    fprof进行性能分析. 这些你都用了么?





