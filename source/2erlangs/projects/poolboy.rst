Poolboy - A hunky Erlang worker pool factory
#################################################################

源码
===============
::

    git://github.com/basho/poolboy.git

用法
=================
::

    1> Worker = poolboy:checkout(PoolName).
    <0.9001.0>
    2> gen_server:call(Worker, Request).
    ok
    3> poolboy:checkin(PoolName, Worker).
    ok

选项
==============

* ``name`` the pool name
* ``worker_module`` the module that represents the workers
* ``size`` the maximum pool size
* ``max_overflow`` the maximum number of workers created if pool is empty


实例
=================

* example.app:

.. literalinclude:: ./poolboys/files/example.app
   :language: erlang
   :linenos:

* example.erl:

.. literalinclude:: ./poolboys/files/example.erl
   :language: erlang
   :linenos:

* example_worker.erl:

.. literalinclude:: ./poolboys/files/example_worker.erl
   :language: erlang
   :linenos:










