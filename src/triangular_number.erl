%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%% {9839.289809,{76576500,{divisors_count,576}}}
%%% @end
%%% Created : 02. Sep 2019 20:02
%%%-------------------------------------------------------------------
-module(triangular_number).
-author("iiwaasnet").

%% API
-export([run/1,
  get_triangle/3]).

run(MaxDivisorsCount) ->
  {Microsec, Res} = timer:tc(triangular_number, get_triangle, [1, 1, MaxDivisorsCount]),
  {Microsec / 1000000, Res}.
  %%get_triangle(1, 1, MaxDivisorsCount).

get_triangle(Triangle, LastNumber, MaxDivisorsCount) ->
  DivisorsCount = get_divisors_count(Triangle),
  if
    DivisorsCount >= MaxDivisorsCount ->
      {Triangle, {divisors_count, DivisorsCount}};
    DivisorsCount < MaxDivisorsCount ->
      NextNumber = LastNumber + 1,
      get_triangle(Triangle + NextNumber, NextNumber, MaxDivisorsCount)
  end.

get_divisors_count(Triangle) ->
  get_divisors_count(Triangle, 1, 0).
get_divisors_count(Triangle, Divisor, Count) when Divisor > Triangle ->
  Count;
get_divisors_count(Triangle, Divisor, Count) when Triangle rem Divisor =:= 0 ->
  get_divisors_count(Triangle, Divisor + 1, Count + 1);
get_divisors_count(Triangle, Divisor, Count) when Triangle rem Divisor /= 0 ->
  get_divisors_count(Triangle, Divisor + 1, Count).
