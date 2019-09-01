%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Sep 2019 12:22
%%%-------------------------------------------------------------------
-module(primes_sum).
-author("iiwaasnet").

%% API
-export([run/1]).

run(MaxNumber) ->
  lists:sum(sieve(MaxNumber)).

sieve(To) ->
  filter_primes(lists:seq(2, To), [], To).

filter_primes([X|T], Acc, MaxValue) when X > 1, X * X =< MaxValue ->
  XPrimed = [E || E <- T, E rem X /= 0],
  filter_primes(XPrimed, [X|Acc], MaxValue);
filter_primes([X|T], Acc, MaxValue) when X * X > MaxValue ->
  lists:merge(Acc, [X|T]);
filter_primes([], Acc, _) ->
  Acc.