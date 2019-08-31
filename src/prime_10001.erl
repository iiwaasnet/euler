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
-export([run/1]).

run(PrimePosition) ->
  get_nth_prime(PrimePosition).

get_nth_prime(PrimePosition) ->
  get_nth_prime(2, PrimePosition).

get_nth_prime(Number, 0) ->
  Number - 1;
get_nth_prime(Number, PrimePosition) ->
  case is_prime(Number) of
    true ->
      get_nth_prime(Number + 1, PrimePosition - 1);
    false ->
      get_nth_prime(Number + 1, PrimePosition)
  end.

is_prime(Number) when Number > 1 ->
  is_prime(Number, 2).

is_prime(Number, Divider) when Divider > Number ->
  false;
is_prime(Number, Divider) ->
  case Number div Divider of
    1 ->
      true;
    _ ->
      case Number rem Divider of
        0 ->
          false;
        _ ->
          is_prime(Number, Divider + 1)
      end
  end.