%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Aug 2019 18:59
%%%-------------------------------------------------------------------
-module(mult_of_3and5).
-author("iiwaasnet").

%% API
-export([run/1]).

run(UpperMargin) ->
  lists:sum([X || X <- lists:seq(1, UpperMargin - 1), X rem 3 == 0 orelse X rem 5 == 0]).