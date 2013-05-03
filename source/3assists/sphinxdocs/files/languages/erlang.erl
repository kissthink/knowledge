%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc calllist analysis startup code

-module(ca).
-author('author <author@example.com>').
-export([start/0, start_link/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.

%% @spec start_link() -> {ok,Pid::pid()}
%% @doc Starts the app for inclusion in a supervisor tree
start_link() ->
    ensure_started(inets),
    ensure_started(crypto),
    ensure_started(cel),
    ensure_started(mochiweb),
    ensure_started(emysql),
    ensure_started(erldis),
    application:set_env(webmachine, webmachine_logger_module, 
                        webmachine_logger),
    ensure_started(webmachine),
    ca_sup:start_link().

%% @spec start() -> ok
%% @doc Start the calllist analysis server.
start() ->
    ensure_started(inets),
    ensure_started(crypto),
    ensure_started(cel),
    ensure_started(mochiweb),
    ensure_started(emysql),
    ensure_started(erldis),

    application:set_env(webmachine, webmachine_logger_module, 
                        webmachine_logger),
    ensure_started(webmachine),
    application:start(ca).

%% @spec stop() -> ok
%% @doc Stop the calllist analysis server.
stop() ->
    Res = application:stop(ca),
    application:stop(webmachine),

    application:stop(erldis),
    application:stop(emysql),
    application:stop(mochiweb),
    application:stop(cel),
    application:stop(crypto),
    application:stop(inets),
    Res.
