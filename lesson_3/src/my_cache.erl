%% @author maria
%% @doc @todo Add description to my_cache.


-module(my_cache).

%% ====================================================================
%% API functions
%% ====================================================================
-export([create/0, insert/3, lookup/1, delete_obsolete/0]).
-define(Table, cache).

create() ->
	ets:new(?Table, [public, named_table]),
	ok.

insert(Key, Value, Time) ->
	Obsoletion_time = Time + current_time(),
	ets:insert(?Table, {Key, Value, Obsoletion_time}),
	ok.

lookup(Key) ->
	Element = ets:lookup(?Table, Key),
	[{Key, Value, Obsoletion_time}] = Element,
	case Obsoletion_time > current_time() of
		true -> {ok, Value};
		false -> undefined
	end.

delete_obsolete() ->
	List = ets:tab2list(?Table),
	delete_obsolete(List).

delete_obsolete([H|T]) ->
	{Key, _Value, Obsoletion_time} = H,
	case Obsoletion_time < current_time() of 
		true -> ets:delete(?Table, Key), delete_obsolete();
		false -> delete_obsolete(T)
	end;

delete_obsolete([]) ->
%%	ets:match_object(?Table, {'$0', '$1', '$3'}).
	ok.
	
current_time() ->
	calendar:datetime_to_gregorian_seconds(erlang:localtime()).

	
%% ====================================================================
%% Internal functions
%% ====================================================================


