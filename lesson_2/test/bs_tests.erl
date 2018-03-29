-module(bs_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

bs01_test_() -> [
	?_assert(bs01:first_word(<<"Hello World!">>) =:= <<"Hello">>),
	?_assert(bs01:first_word(<<"Hello ">>) =:= <<"Hello">>),
	?_assert(bs01:first_word(<<"Too long text here!">>) =:= <<"Too">>)].

bs02_test_() -> [
	?_assert(bs02:words(<<"Hello World">>) =:= [<<"Hello">>,<<"World">>]),
	?_assert(bs02:words(<<"Text with four words">>) =:= [<<"Text">>,<<"with">>,<<"four">>,<<"words">>]),
	?_assert(bs02:words(<<"Hello">>) =:= [<<"Hello">>]),
	?_assert(bs02:words(<<>>) =:= [<<>>])].

bs03_test_() -> [
	?_assert(bs03:split(<<"Hello World">>, " ") =:= [<<"Hello">>,<<"World">>]),
	?_assert(bs03:split(<<"Col1-:-Col2-:-Col3-:-Col4">>, "-:-") =:= [<<"Col1">>,<<"Col2">>,<<"Col3">>,<<"Col4">>]),
	?_assert(bs03:split(<<"Hello|Goodbye|Good morning">>, "|") =:= [<<"Hello">>,<<"Goodbye">>,<<"Good morning">>])].

-endif.
