.. _rebar_quickstart:

快速开始
=========

.. _quickstart_createapp:

创建应用
---------

    * create a folder::

        $ mkdir myapp; cd myapp 

    * download rebar::

        $ wget http://cloud.github.com/downloads/basho/rebar/rebar && chmod u+x rebar
        or手动编译源码生成,命令如下:
        git clone git://github.com/basho/rebar.git
        cd rebar/
        ./bootstrap

    * create::

        $ ./rebar create-app appid=myapp$

    * compile the application::

        $ ./rebar compile

    * cleanup the directory::

        $ ./rebar clean

.. _quickstart_eunit:

单元测试
---------

    * 增加eunit的头::

        -ifdef(TEST).
        -include_lib("eunit/include/eunit.hrl").
        -endif.

    * 增加eunit内容::

        -ifdef(TEST).
        simple_test() ->
              ok = application:start(myapp),
              ?assertNot(undefined == whereis(myapp_sup)).
        -endif.

    * 用eunit编译::

        $ ./rebar compile eunit

    * 为检查unit tests的覆盖测试的情况,可以在文件 ``rebar.config`` 下增加如下代码::

        {cover_enabled, true}.

.. _quickstart_command:

命令列表
--------

   `Rebar commands <https://github.com/basho/rebar/wiki/Rebar-commands>`_

.. _quickstart_upgrades:

热更新
------

    `Upgrades <https://github.com/basho/rebar/wiki/Upgrades>`_

.. _quickstart_release:

发布处理
--------

    * 创建应用::

        ./rebar create-app appid=exemplar

    * 创建结点::

        mkdir rel; cd rel
        ../rebar create-node nodeid=exemplar

    * 在文件 ``myapp/rebar.config`` 中增加如下一行::

        {sub_dirs, ["rel"]}.

    * 运行::

        ./rebar generate
