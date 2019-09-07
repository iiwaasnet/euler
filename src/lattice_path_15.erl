%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Sep 2019 18:04
%%%-------------------------------------------------------------------
-module(lattice_path_15).
-author("iiwaasnet").

%% API
-export([run/1]).

run(GridSize) ->
  length(span({1, 1}, GridSize)).

span(Nodes, GridSize) ->
  NewNodes = lists:append(
    [{R + 1, C} || {R, C} <- Nodes, R < GridSize],
    [{R, C + 1} || {R, C} <- Nodes, C < GridSize]
  ),
  case NewNodes of
    [] ->
      Nodes;
    _ ->
      span(NewNodes, GridSize)
  end.
