%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Sep 2019 18:24
%%%-------------------------------------------------------------------
-module(prime_factors).
-author("iiwaasnet").
-import(sieve, [new/1]).

%% API
-export([get/1]).

get(Number) ->
  get_primes(Number, sieve:new(Number), []).

get_primes(_, [], Acc) ->
  lists:sort(Acc);
get_primes(Number, [H | T], Acc) ->
  case Number rem H of
    0 ->
      get_primes(Number div H, [H | T], [H | Acc]);
    _ ->
      get_primes(Number, T, Acc)
  end.
