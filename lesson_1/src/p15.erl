%% @author maria
%% @doc @todo Add description to p15.


-module(p15).

%% ====================================================================
%% API functions
%% ====================================================================
-export([replicate/2, replicate1/2]).

replicate(L, Acc) ->
	replicate(L, Acc, Acc).

replicate([], _, _) ->
	[];

replicate([_H|T], Acc, 0) ->
	replicate(T, Acc, Acc);
replicate([H|T], Acc, N) ->
	[H|replicate([H|T], Acc, N-1)].


replicate1([], _) ->
	[];
replicate1([H], 1) ->
	[H];
replicate1([H], N) ->
	[H|replicate1([H], N-1)];

replicate1([H|T], N) ->
	[replicate1([H],N)|replicate1(T,N)].




%% ====================================================================
%% Internal functions
%% ====================================================================


