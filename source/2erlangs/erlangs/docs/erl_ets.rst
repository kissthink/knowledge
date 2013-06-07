.. _erl_ets:

ets模块
################

delete(Tab) -> true
-----------------------

Types::

    Tab = tab()

删除整个Tab表

delete(Tab, Key) -> true
--------------------------------

Types::

    Tab = tab()
    Key = term()

删除表Tab中key为Key的所有对象


lookup(Tab, Key) -> [Object]
-------------------------------

Types::

    Tab = tab()
    Key = term()
    Object = tuple()

返回表Tab中key为Key的所有对象列表




