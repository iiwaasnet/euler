%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%% Calculates number, having given count of factors FactorCount
%%% @end
%%% Created : 04. Sep 2019 20:06
%%%-------------------------------------------------------------------
-module(nff).
-author("iiwaasnet").
-import(sieve, [new/1]).
-import(prime_factors, []).

%% API
-export([get/1]).

get(FactorCount) ->
  FactorCountPrimes = lists:reverse(prime_factors:get(FactorCount)),
  Sieve = sieve:new(FactorCount),
  CandidatePrimes = lists:sublist(Sieve, length(FactorCountPrimes)),
  erlang:display(FactorCountPrimes),
  erlang:display(CandidatePrimes),
  Factors = lists:zipwith(fun(X, Y) -> trunc(math:pow(X, Y - 1)) end, CandidatePrimes, FactorCountPrimes),
  lists:foldl(fun(E, Acc) -> E * Acc end, 1, Factors).
