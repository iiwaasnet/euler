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
  UpperBound = 100,
  Primes = prime_gen(2, UpperBound),
  get_prime_factors(Number, {Primes,  UpperBound}, []).

get_prime_factors(1, _, Acc) ->
  Acc;
get_prime_factors(Number, {Primes, UpperBound}, Acc) ->
  case get_lowest_prime(Number, Primes) of
    {none, none} ->
      NewUpperBound = UpperBound + 100,
      NewPrimes = lists:merge(Primes, prime_gen(UpperBound, NewUpperBound)),
      get_prime_factors(Number, {NewPrimes, NewUpperBound}, Acc);
    {Prime, Rest} ->
      get_prime_factors(Rest, {Primes, UpperBound}, [Prime|Acc])
  end.

get_lowest_prime(Number, [Prime|T]) ->
  case Number rem Prime of
    0 -> {Prime, Number div Prime};
    _ -> get_lowest_prime(Number, T)
  end;
get_lowest_prime(_, []) ->
  {none, none}.

prime_gen(From, To) ->
  filter_primes(lists:seq(From, To), [], To).

filter_primes([X|T], Acc, MaxValue) when X > 1, X * X =< MaxValue ->
  XPrimed = [E || E <- T, E rem X /= 0],
  filter_primes(XPrimed, [X|Acc], MaxValue);
filter_primes([X|T], Acc, MaxValue) when X * X > MaxValue ->
  lists:merge(Acc, [X|T]);
filter_primes([], Acc, _) ->
  Acc.


