%% @author maria
%% @doc @todo Add description to bs03.


-module(bs03).

%% ====================================================================
%% API functions
%% ====================================================================
-export([split/2]).
split(B, K) ->
	Key = list_to_binary(K), 
	split(B, Key, size(Key), <<>>, []).

split(B, Key, Size, Acc, L) ->
	case B of 
		<<Key:Size/binary, Rest/binary>> -> split(Rest, Key, Size, <<>>, [Acc|L]);
		<<X, Rest/binary>> -> split(Rest, Key, Size, <<Acc/binary, X>>, L);
		<<>> -> lists:reverse([Acc|L])
	end.

	

%% ====================================================================
%% Internal functions
%% bs03:split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, "-:-").
%% ====================================================================


