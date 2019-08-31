%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. Aug 2019 20:22
%%%-------------------------------------------------------------------
-module(sum_sqr_diff).
-author("iiwaasnet").

%% API
-export([run/1]).

run(Number) ->
  gen_combinations(lists:seq(1, Number), 0).

gen_combinations([], Acc) ->
  Acc;
gen_combinations([H|T], Acc) ->
  gen_combinations(T, Acc + lists:sum([X * H * 2 || X <- T])).