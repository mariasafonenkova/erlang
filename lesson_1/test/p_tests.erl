-module(p_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-import(p01, [last/1]).
-import(p02, [but_last/1]).
-import(p03, [element_at/2]).
-import(p04, [len/1]).
-import(p05, [reverse/1]).
-import(p06, [is_palindrome/1]).
-import(p07, [flatten/1]).
-import(p08, [compress/1]).
-import(p09, [pack/1]).
-import(p10, [encode/1]).
-import(p11, [encode_modified/1]).
-import(p12, [decode_modified/1]).
-import(p13, [decode/1]).
-import(p14, [duplicate/1]).
-import(p15, [replicate/2]).

p01_test_() -> [
	?_assert(last([1, 2, 3]) =:= 3),
	?_assert(last([a, b, c]) =:= c),
	?_assert(last([a]) =:= a)].

p02_test_() -> [
	?_assert(but_last([1, 2]) =:= [1, 2]),
	?_assert(but_last([a, b, c]) =:= [b, c]),
	?_assert(but_last([a, b , c, d]) =:= [c, d])].	

p03_test_() -> [
	?_assert(element_at([1, 2, 3, 4], 1) =:= 1),
	?_assert(element_at([1, 2, 3, 4], 2) =:= 2),
	?_assert(element_at([1, 2, 3, 4], 3) =:= 3)].

p04_test_() -> [
	?_assertEqual(0, len([])),
	?_assertEqual(2, len([1,2])),
	?_assertEqual(3, len([a,b,c])),
	?_assertEqual(6, len([a, bc, we, 1, 2, 3])),
	?_assertEqual(1, len([b]))].

p05_test_() -> [
	?_assertEqual([3,2,1], reverse([1,2,3])),
	?_assertEqual([2,1], reverse([1,2])),
	?_assertEqual([3,2,1], reverse([1,2,3])),
	?_assertEqual([], reverse([]))].

p06_test_() -> [
	?_assertEqual(true, is_palindrome([1,2,3,2,1])),
	?_assertEqual(false, is_palindrome([1,2,3])),
	?_assertEqual(false, is_palindrome([1,2,3,2])),
	?_assertEqual(true, is_palindrome([a,b,c,d,c,b,a])),
	?_assertEqual(false, is_palindrome([a,b,c,d,c]))].

p07_test_() -> [
	?_assertEqual([a,b,c,d,e], flatten([a,[],[b,[c,d],e]])),
	?_assertEqual([b,c,d,e], flatten([[],[b,[c,d],e]]))].

p08_test_() -> [
	?_assertEqual([a,b,c,a,d,e], compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
	?_assertEqual([a,b,c,a,d,e], compress([a,b,c,c,a,a,d,e,e,e,e]))].

p09_test_() -> [
	?_assertEqual([[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]], pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
	?_assertEqual([[a],[b],[c,c],[a,a],[d],[e,e,e,e]], pack([a,b,c,c,a,a,d,e,e,e,e]))].

p10_test_() -> [
	?_assertEqual([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}], encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
	?_assertEqual([{3,c}], p10:encode([c,c,c])),
	?_assertEqual([{1,a}], p10:encode([a])),
	?_assertEqual([], p10:encode([]))].

p11_test_() -> [
	?_assertEqual([{4,a},b,{2,c},{2,a},d,{4,e}], encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
	?_assertEqual([a,b], encode_modified([a,b])),
	?_assertEqual([a], encode_modified([a])),
	?_assertEqual([], encode_modified([]))].

p12_test_() -> [
	?_assertEqual([a,a,a,a,b,c,c,a,a,d,e,e,e,e], decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}])),
	?_assertEqual([a,a,a,b,c], decode_modified([{3,a}, b,c])),
	?_assertEqual([a,b], decode_modified([a,b]))].

p13_test_() -> [
	?_assertEqual([a,a,a,a,b,c,c,a,a,d,e,e,e,e], decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}])),
	?_assertEqual([a,a,a,a,a], decode([{5,a}])),
	?_assertEqual([a], decode([{1,a}])),
	?_assertEqual([], decode([]))].

p14_test_() -> [
	?_assertEqual([a,a,b,b,c,c,c,c,d,d], duplicate([a,b,c,c,d])),
	?_assertEqual([1,1,2,2,3,3,4,4], duplicate([1,2,3,4])),
	?_assertEqual([], duplicate([]))].

p15_test_() -> [
	?_assertEqual([a,a,a,b,b,b,c,c,c], replicate([a,b,c], 3)),
	?_assertEqual([a,b,c], replicate([a,b,c], 1))].

-endif.



