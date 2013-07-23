larger——a logging framework for Erlang
##################################################

源码
======
::

    git://github.com/basho/lager.git


Overview
=============

Larger is a logging framework for Erlang. Its purpose is to provide a more traditional way to perform logging in an erlang application that plays nicely with traditional UNIX logging tools like ``logrotate`` and ``syslog``.


Features
=================

* Finer grain log levels(debug, info, notice, warning, error, critical, alter, emergency)
* to be continued ...



简单用法
==============
* add following option to the erlang compile flag::

    {parse_transform, lager_transform}
    %% or add following to the module
    -compile([{parse_transform, lager_transform}]).

* start the larger::

    larger:start().

* general form is ``larger:Severity()`` where Severity is one of the log level mentioned above. here is some example::

    lager:error("Some message")
    lager:warning("Some message with a term: ~p", [Term])


配置文件
=============
::

    {lager, [
      {handlers, [
        {lager_console_backend, info},
        {lager_file_backend, [{file, "error.log"}, {level, error}]},
        {lager_file_backend, [{file, "console.log"}, {level, info}]}
      ]}
    ]}.


TO BE CONTINUED... ...







