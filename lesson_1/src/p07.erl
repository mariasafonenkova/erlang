%% @author maria
%% @doc @todo Add description to p07.


-module(p07).

%% ====================================================================
%% API functions
%% ====================================================================
-export([flatten/1]).

flatten([]) ->
	[];
flatten([[]|T]) ->
	flatten(T);
flatten([[H|T]|L]) ->
	flatten([H|[T|L]]);
flatten([H|T]) ->
	[H|flatten(T)].


%% ====================================================================
%% Internal functions
%% ====================================================================
