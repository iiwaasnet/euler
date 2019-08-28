%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Aug 2019 20:45
%%%-------------------------------------------------------------------
-module(largest_prime).
-author("iiwaasnet").

%% API
-export([run/1]).

run(Number) ->
  Primes = prime_gen(Number),
  get_prime_factors(Number, Primes, []).

get_prime_factors(1, _, Acc) ->
  Acc;
get_prime_factors(Number, Primes, Acc) ->
  {Prime, Rest} = get_first_prime(Number, Primes),
  get_prime_factors(Rest, Primes, [Prime|Acc]).


get_first_prime(Number, [Prime|T]) ->
  case Number rem Prime of
    0 -> {Prime, Number div Prime};
    _ -> get_first_prime(Number, T)
  end.

prime_gen(UpperBound) ->
  filter_primes(lists:seq(2, UpperBound), [], UpperBound).

filter_primes([X|T], Acc, UpperBound) when X > 1, X * X =< UpperBound ->
  XPrimed = [E || E <- T, E rem X /= 0],
  filter_primes(XPrimed, [X|Acc], UpperBound);
filter_primes([X|T], Acc, UpperBound) when X * X > UpperBound ->
  lists:merge(Acc, [X|T]);
filter_primes([], Acc, _) ->
  Acc.


