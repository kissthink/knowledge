

Websocket handlers
##############################

* Websocket is an IETF standard
* for backward compatibility reasons a solution like `Bullet <https://github.com/extend/bullet>`_ might be preferred


Usage
-------------

* receive data from the client, through ``websocket_handle/3``
* receive data from the server, through ``websocket_info/3``
* upgrade the connection to use the Websocket protocol::

    init({tcp, http}, Req, Opts) ->
        {upgrade, protocol, cowboy_websocket}

* Cowboy will then switch the protocol and call ``websocket_init/3``
* followed by zero or more calls to ``websocket_handle/3`` and ``websocket_info/3``
* when the connection is shutting down, ``websocket_terminate/3`` will be called

Example(The folling handle sends a msg every second, it also echoes what it receives)::

    -module(my_ws_handler).
    -behavior(cowboy_websocket_handler).

    -export([init/3]).
    -export([websocket_handle/3, websocket_info/3]).
    -export([websocket_init/3, websocket_terminate/3]).

    init({tcp, http}, Req, Opts) ->
        {upgrade, protocol, cowboy_websocket}.

    websocket_init(TransportName, Req, _Opts) ->
        erlang:start_timer(1000, self(), <<"hello">>,
        {ok, Req, undefined_state}.

    websocket_handle({text, Msg}, Req, State) ->
        {reply, {text, <<"That's what she said!", Msg/binary>>}, Req, State};
    websocket_handle(_Data, Req, State) ->
        {ok, Req, State}.

    websocket_info({timeout, _Ref, Msg}, Req, State) ->
        erlang:start_timer(1000, self(), <<"How' you doin'?">>),
        {reply, {text, Msg}, Req, State};
    websocket_info(_Info, Req, State) ->
        {ok, Req, State}.

    websocket_terminate(_Reason, _Req, _State) ->
        ok.



