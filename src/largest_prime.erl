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
  max_prime_factor(Number, 2).

max_prime_factor(1, Factor) ->
  Factor;
max_prime_factor(Number, Factor) ->
  case Number rem Factor of
    0 -> max_prime_factor(Number div Factor, Factor);
    _ -> max_prime_factor(Number, Factor + 1)
  end.