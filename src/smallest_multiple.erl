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
-export([run/1,
  run1/1]).

run1(Number) ->
  Primes = get_all_primes(lists:seq(1, Number)).

primes_to_tuple(Primes) ->
  primes_to_tuples(Primes, []).

primes_to_tuple(Primes, []) ->


%%==========================================
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


1, 2, 3, 4, 5, 6, 7, 8, 9, 10

lcm = 1,

1 rem 1 == 0 -> 1
1 rem 2 != 0 -> 1 * 2
2 rem 3 != 0 -> 2 * 3
6 rem (2 * 2) != 0 -> 6 * 2
12 rem (5) != 0 -> 12 * 5
60 rem (2 * 3) == 0 -> 60
60 rem 7 != 0 -> 7 * 60
420 rem (2 * 2 * 2) == 0 -> 2 * 420
840 rem (3 * 3) != 0 -> 840 * 3
2520 rem (2 * 5) == 0 -> 2520