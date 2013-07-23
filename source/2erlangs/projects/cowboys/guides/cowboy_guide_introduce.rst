

cowboy简介
--------------------

* Cowboy is developed for Erlang R15B+.
* Cowboy requires the crypto and ranch applications to be started::

    ok = application:start(crypto).
    ok = application:start(ranch).
    ok = application:start(cowboy).

* Cowboy uses Ranch for handling the connections and provides convenience functions to start Ranch listeners
* Webmachine-based REST::

    Dispatch = cowboy_router:compile([
        %% {URIHost, list({URIPath, Handler, Opts})}
        {'_', [{'_', my_handler, []}]}
    ]),
    %% Name, NbAcceptors, TransOpts, ProtoOpts
    cowboy:start_http(my_http_listener, 100,
        [{port, 8080}],
        [{env, [{dispatch, Dispatch}]}]
    ).


* Cowboy features many kinds of handlers. It has plain HTTP handlers, loop handlers, Websocket handlers, REST handlers and static handlers. 
* Most applications use the plain HTTP handler, which has three callback functions: init/3, handle/2 and terminate/3::

    -module(my_handler).
    -behaviour(cowboy_http_handler).

    -export([init/3]).
    -export([handle/2]).
    -export([terminate/3]).

    init({tcp, http}, Req, Opts) ->
        {ok, Req, undefined_state}.

    handle(Req, State) ->
        {ok, Req2} = cowboy_req:reply(200, [], <<"Hello World!">>, Req),
        {ok, Req2, State}.

    terminate(Reason, Req, State) ->
        ok.

