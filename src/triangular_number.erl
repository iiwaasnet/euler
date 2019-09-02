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

run(DivisorsNumber) ->
  get_triangle([1], DivisorsNumber).

get_triangle(Seq, DivisorsNumber) ->
  Triangle = lists:foldl(fun(E, A) -> A + E end, 0, Seq),
  Divisors = [X || X <- lists:seq(1, Triangle), Triangle rem X =:= 0],
  if
    length(Divisors) >= DivisorsNumber ->
      {Triangle, {divisors_count, length(Divisors)}, Divisors};
    true ->
      get_triangle(lists:seq(1, length(Seq) + 1), DivisorsNumber)
  end.

