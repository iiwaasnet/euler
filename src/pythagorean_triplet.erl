%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. Aug 2019 20:33
%%%-------------------------------------------------------------------
-module(pythagorean_triplet).
-author("iiwaasnet").

%% API
-export([run/0]).

run() ->
  filter(gen_sequence()).

filter([]) ->
  false;
filter([{A, B, C} | T]) ->
  case func(A, B, C) of
    true ->
      {A, B, C, A * B * C};
    false ->
      filter(T)
  end.

gen_sequence() ->
  [{A, B, (1000 - A - B)} || A <- lists:seq(1, 1000), B <- lists:seq(1, 1000), A < B, B < 1000 - A - B].

func(A, B, C) ->
  A + B + C =:= 1000 andalso
    math:pow(A, 2) + math:pow(B, 2) =:= math:pow(C, 2).