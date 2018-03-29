-module(lesson_3_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

create_test_() -> [
	?_assert(my_cache:create() =:= ok)].

insert_test_() -> [
	?_assert(my_cache:insert(1, 2, 60) =:= ok),
	?_assert(my_cache:insert(2, 3, 600) =:= ok),
	?_assert(my_cache:insert(3, 4, 5) =:= ok),
	?_assert(my_cache:insert(4, 5, 0) =:= ok)].

lookup_test_() -> 
	timer:sleep(5000),
	[
	?_assert(my_cache:lookup(1) =:= {ok, 2}),
	?_assert(my_cache:lookup(2) =:= {ok, 3}),
	?_assert(my_cache:lookup(3) =:= undefined),
	?_assert(my_cache:lookup(4) =:= undefined)].

delete_obsolete_test_() -> [
	?_assert(my_cache:delete_obsolete() =:= ok)].

-endif.
