%% @author maria
%% @doc @todo Add description to p12.


-module(p12).

%% ====================================================================
%% API functions
%% ====================================================================
-export([decode_modified/1]).
decode_modified([]) ->
	[];
decode_modified([{2,H}|T]) ->
	decode_modified([H|[H|T]]);
decode_modified([{N,H}|T]) ->
	decode_modified([{N-1,H}|[H|T]]);
decode_modified([H|T]) ->
	[H|decode_modified(T)].


%% ====================================================================
%% Internal functions
%% ====================================================================


