%% @author maria
%% @doc @todo Add description to bs02.


-module(bs02).

%% ====================================================================
%% API functions
%% ====================================================================
-export([words/1]).
words(B) ->
	words(B, <<>>, []).

words(<<>>, Acc, L) ->
	lists:reverse([Acc|L]);
words(<<" ", Rest/binary>>, Acc, L) ->
	words(Rest, <<>>, [Acc|L]);
words(<<X, Rest/binary>>, Acc, L) ->
	words(Rest, <<Acc/binary, X>>, L).



%% ====================================================================
%% Internal functions
%% bs02:words(<<"Text with four words">>).
%% ====================================================================


