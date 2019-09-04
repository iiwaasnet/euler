%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Sep 2019 18:25
%%%-------------------------------------------------------------------
-module(sieve).
-author("iiwaasnet").

%% API
-export([new/1]).

new(To) ->
  lists:sort(filter_primes(lists:seq(2, To), [], To)).

filter_primes([X|T], Acc, MaxValue) when X > 1, X * X =< MaxValue ->
  XPrimed = [E || E <- T, E rem X /= 0],
  filter_primes(XPrimed, [X|Acc], MaxValue);
filter_primes([X|T], Acc, MaxValue) when X * X > MaxValue ->
  lists:merge(Acc, [X|T]);
filter_primes([], Acc, _) ->
  Acc.
