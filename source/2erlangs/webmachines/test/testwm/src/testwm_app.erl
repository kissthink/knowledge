%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc Callbacks for the testwm application.

-module(testwm_app).
-author('author <author@example.com>').

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for testwm.
start(_Type, _StartArgs) ->
    testwm_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for testwm.
stop(_State) ->
    ok.
