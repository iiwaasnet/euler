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
  .

prime_gen(UpperBound) ->
  [H|T] = lists:seq(2, UpperBound),
  filter(H, [H|T], []).

filter(X, [X|T], Acc) ->
  XPrimed = lists:filter(fun(E) -> E rem X /= 0 end),
  case XPrimed of
    [] -> []
  end


