

Handlers
###################

* Handlers are Erlang modules that represent a resource
* Handlers must process the request and send a reply. The nature of the reply will vary between handlers.
* Different kinds of handlers can be combined in a single module.



.. toctree::
   :maxdepth: 2

    handlers/cowboy_guide_handler_http
    handlers/cowboy_guide_handler_loop
    handlers/cowboy_guide_handler_websocket
    handlers/cowboy_guide_handler_rest
    handlers/cowboy_guide_handler_static


* All of them have a common entry point: the init/3 function
* By default, Cowboy considers your handler to be an HTTP handler.
* To switch to a different protocol, you must perform a protocol upgrade; at the end of ``init/3``, return a tuple like::

    % upgrade the handler to my_protocol
    init(_Any, _Req, _Opts) ->
        {upgrade, protocol, my_protocol}.


Custom protocol upgrades
----------------------------------

* the ``<my_protocol>`` should use ``cowboy_sub_protocol`` protocol, which requires only one callback -- ``upgrade/4``
* ``upgrade`` 格式::

    upgrade(Req, Env, Handler, HandlerOpts) ->
    %% ...
