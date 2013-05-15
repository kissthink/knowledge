

路由
==============
Structure
^^^^^^^^^^^^

基本结构::

    Routes = [Host1, Host2, ... HostN]

Each host contains::

    Host1 = {HostMatch, PathsList}.
    Host2 = {HostMatch, Constraints, PathsList}.

The list of routes for the path component::

    PathsList = [Path1, Path2, ... PathN].

each path contains matching rules::

    Path1 = {PathMatch, Handler, Opts}.
    Path2 = {PathMatch, Constraints, Handler, Opts}.


Match syntax(可参考Structure对比学习)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It can be given as either a string() or a binary()::

    PathMatch1 = "/".
    PathMatch2 = "/path/to/resource".

    HostMatch1 = "cowboy.example.org".

path前面要有 ``/`` 后面可有可无, host前面后面都可有可无 ``.``::

    % 下面两句一样
    PathMatch2 = "/path/to/resource".
    PathMatch3 = "/path/to/resource/".

    % 下面三句一样
    HostMatch1 = "cowboy.example.org".
    HostMatch2 = "cowboy.example.org.".
    HostMatch3 = ".cowboy.example.org".

``:<Name>`` 代表任一值, 可在后面用 ``cowboy_req:binding/{2,3}`` 取出数据, ``:_`` 在不需要值时使用::

    PathMatch = "/hats/:name/prices".
    HostMatch = ":subdomain.example.org".
    % http://test.example.org/hats/wild_cowboy_legendary/prices
    % 在对应中
    % test bound to the name subdomain
    % wild_cowboy_legendary bound to the name name

    HostMatch = "ninenines.:_".
    % :_的用法
    PathMatch = "/hats/:name/:name".

Anything between brackets is optional::

    PathMatch = "/hats/[page/:number]".
    HostMatch = "[www.]ninenines.eu".

    PathMatch = "/hats/[page/[:number]]".

You can retrieve the rest of host or path using ``[...]``, and then find the segments using ``cowboy_req:host_info/1`` and ``cowboy_req:path_info/1`` respectively::

    PathMatch = "/hats/[...]".
    HostMatch = "[...]ninenines.eu".

There are two special match value that can be used, atom ``'_'`` will match any host or path; and ``"*"`` will match the wildcard path, generally used alongside the ``OPTION`` method::

    PathMatch = '_'.
    HostMatch = '_'.

    HostMatch = "*".

Constraints
^^^^^^^^^^^^^^^^^
暂时不大明白

Compilation
^^^^^^^^^^^^^^^^^

The structure defined in this charpter needs to be compiled before it is passed to Cowboy. This can be done with a simple call to ``cowboy_route:compile/2``::

    Dispatch = cowboy_router:compile([
        %% {HostMatch, list({PathMatch, Handler, Opts})}
        {'_', [{'_', my_handler, []}]}
    ]),
    %% Name, NbAcceptors, TransOpts, ProtoOpts
    cowboy:start_http(my_http_listener, 100,
        [{port, 8080}],
        [{env, [{dispatch, Dispatch}]}]
    ).

.. note::

    This function will return ``{error, badarg}`` if the structure given is incorrect.

Live update
^^^^^^^^^^^^^^^^^^

You can update the dispatch using ``cowboy:set_env/3``::

    cowboy:set_env(my_http_listener, dispatch,
        cowboy_router:compile(Dispatch)
    ).

.. note::

    Note that you need to compile the routes before updating




