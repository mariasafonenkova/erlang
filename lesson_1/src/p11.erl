%% @author maria
%% @doc @todo Add description to p11.


-module(p11).

%% ====================================================================
%% API functions
%% ====================================================================
-export([encode_modified/1]).
encode_modified([]) ->
	[];
encode_modified([H|[H|T]]) ->
	encode_modified([{2,H}|T]);
encode_modified([{N,H}|[H|T]]) ->
	encode_modified([{N+1,H}|T]);
encode_modified([H|T]) ->
	[H|encode_modified(T)].



%% ====================================================================
%% Internal functions
%% ====================================================================


