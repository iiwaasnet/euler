%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Aug 2019 18:30
%%%-------------------------------------------------------------------
-module(smallest_multiple).
-author("iiwaasnet").

%% API
-export([run/1]).

run(Number) ->
  product(get_lcm_primes(lists:seq(1, Number), [])).

get_lcm_primes([], Acc) ->
  Acc;
get_lcm_primes([H|T], Acc) ->
  Primes = get_primes(H),
  get_lcm_primes(T, merge_lcm(Acc, Primes)).

get_primes(Number) ->
  get_primes(Number, 2, []).
get_primes(1, _, Primes) ->
  Primes;
get_primes(Number, Divider, Primes) ->
  case Number rem Divider of
    0 ->
      get_primes(Number div Divider, Divider, [Divider|Primes]);
    _ ->
      get_primes(Number, Divider + 1, Primes)
  end.

merge_lcm(List1, List2) ->
  lists:merge(
    [X ||
    X <- List1,
    item_count(X, List1) >= item_count(X, List2)]
    ,
    [X ||
      X <- List2,
      item_count(X, List2) > item_count(X, List1)]
  ).

item_count(X, List) ->
  item_count(X, lists:sort(List), 0).

item_count(_, [], Count) ->
  Count;
item_count(X, [X|T], Count) ->
  item_count(X, T, Count + 1);
item_count(X, [_|T], Count) ->
  item_count(X, T, Count).

product(List) ->
  product(List, 1).
product([], Acc) ->
  Acc;
product([H|T], Acc) ->
  product(T, Acc * H).