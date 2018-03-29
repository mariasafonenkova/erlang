%% @author maria
%% @doc @todo Add description to p10.


-module(p10).

%% ====================================================================
%% API functions
%% ====================================================================
-export([encode/1]).
encode([]) ->
	[];
encode(L) ->
	encode(L,1).

encode([H|[H|T]],N) ->
	encode([H|T],N+1);
encode([H|T],N) ->
	[{N,H}|encode(T)].

%% ====================================================================
%% Internal functions
%% ====================================================================

%%encode([]) ->
%%	[];
%%encode([H|[H|T]]) ->
%%	encode([{2,H}|T]);
%%encode([{N,H}|[H|T]]) ->
%%	encode([{N+1,H}|T]);
%%encode([H|[H1|T1]]) ->
%%	[H|encode([{1,H1}|T1])];
%%encode([H|T]) ->
%%	[H|encode(T)].

