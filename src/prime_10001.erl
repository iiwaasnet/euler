%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. Aug 2019 21:20
%%%-------------------------------------------------------------------
-module(prime_10001).
-author("iiwaasnet").

%% API
-export([run1/1,
  gen_primes/1]).

run1(PrimePosition) ->
  get_nth_prime(PrimePosition, {PrimePosition, gen_primes(PrimePosition)}).

get_nth_prime(PrimePosition, {_, Primes}) when PrimePosition =< length(Primes)->
  lists:nth(PrimePosition, Primes);
get_nth_prime(PrimePosition, {Range, Primes}) when PrimePosition > length(Primes)->
  get_nth_prime(PrimePosition, {Range + 100, gen_primes(Range + 100)}).

gen_primes(To) ->
  filter_primes(lists:seq(2, To), [], To).

filter_primes([X|T], Acc, MaxValue) when X > 1, X * X =< MaxValue ->
  XPrimed = [E || E <- T, E rem X /= 0],
  filter_primes(XPrimed, [X|Acc], MaxValue);
filter_primes([X|T], Acc, MaxValue) when X * X > MaxValue ->
  lists:merge(Acc, [X|T]);
filter_primes([], Acc, _) ->
  Acc.

%%=======================================================
%%run(PrimePosition) ->
%%  get_nth_prime(PrimePosition).
%%
%%get_nth_prime(PrimePosition) ->
%%  get_nth_prime(2, PrimePosition).
%%
%%get_nth_prime(Number, 0) ->
%%  Number - 1;
%%get_nth_prime(Number, PrimePosition) ->
%%  case is_prime(Number) of
%%    true ->
%%      get_nth_prime(Number + 1, PrimePosition - 1);
%%    false ->
%%      get_nth_prime(Number + 1, PrimePosition)
%%  end.
%%
%%is_prime(Number) when Number > 1 ->
%%  is_prime(Number, 2).
%%
%%is_prime(Number, Divider) when Divider > Number ->
%%  false;
%%is_prime(Number, Divider) ->
%%  case Number div Divider of
%%    1 ->
%%      true;
%%    _ ->
%%      case Number rem Divider of
%%        0 ->
%%          false;
%%        _ ->
%%          is_prime(Number, Divider + 1)
%%      end
%%  end.