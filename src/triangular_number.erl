%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Sep 2019 20:02
%%%-------------------------------------------------------------------
-module(triangular_number).
-author("iiwaasnet").

%% API
-export([run/1]).

run(DivisorsCount) ->
  get_triangle(1, 1, DivisorsCount).

get_triangle(Triangle, LastNumber, DivisorsCount) ->
  Divisors = [X || X <- gen_divisors_seq(Triangle), Triangle rem X =:= 0],
  if
    length(Divisors) >= DivisorsCount ->
      {Triangle, {divisors_count, length(Divisors)}, Divisors};
    true ->
      %%erlang:display({Triangle, {divisors_count, length(Divisors)}}),
      NextNumber = LastNumber + 1,
      get_triangle(Triangle + NextNumber, NextNumber, DivisorsCount)
  end.

gen_divisors_seq(Until) ->
  case Until rem 2 of
    0 ->
      [X || X <- lists:seq(1, Until)];
    _ ->
      [X || X <- lists:seq(1, Until), Until rem 2 /= 0]
  end.


get_triangle(Seq, DivisorsNumber) ->
  Triangle = lists:foldl(fun(E, A) -> A + E end, 0, Seq),
  Divisors = [X || X <- lists:seq(1, Triangle), Triangle rem X =:= 0],
  if
    length(Divisors) >= DivisorsNumber ->
      {Triangle, {divisors_count, length(Divisors)}, Divisors};
    true ->
      %%erlang:display({Triangle, {divisors_count, length(Divisors)}}),
      get_triangle(lists:seq(1, length(Seq) + 1), DivisorsNumber)
  end.

