%% @author maria
%% @doc @todo Add description to bs01.


-module(bs01).

%% ====================================================================
%% API functions
%% ====================================================================
-export([first_word/1]).
first_word(L) ->
	first_word(L, <<>>).

first_word(<<" ", _Rest/binary>>, L) ->
	L;
first_word(<<X, Rest/binary>>, L) ->
	first_word(Rest, <<L/binary, X>>).
	



%% ====================================================================
%% Internal functions
%% bs01:first_word(<<"Some Text">>).
%% ====================================================================


