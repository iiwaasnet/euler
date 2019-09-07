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
  {ok, Count} = maps:find({GridSize, GridSize}, span(#{{0, 0} => 1}, GridSize)),
  Count.

span(Nodes, GridSize) ->
  NewNodes = map_new_nodes(maps:to_list(Nodes), GridSize, #{}),
  case maps:size(NewNodes) of
    0 ->
      Nodes;
    _ ->
      span(NewNodes, GridSize)
  end.

map_new_nodes([], _, Acc) ->
  Acc;
map_new_nodes([{{R, C}, Count} | T], GridSize, Acc) ->
  map_new_nodes(T,
    GridSize,
    map_new_col(
      {{R, C}, Count},
      GridSize,
      map_new_row({{R, C}, Count}, GridSize, Acc))
  ).

map_new_row({{R, C}, Count}, GridSize, Acc) ->
  if
    R < GridSize ->
      NewR = R + 1,
      case maps:find({NewR, C}, Acc) of
        {ok, Cnt} ->
          Acc#{{NewR, C} := Cnt + Count};
        _ ->
          Acc#{{NewR, C} => Count}
      end;
    true ->
      Acc
  end.

map_new_col({{R, C}, Count}, GridSize, Acc) ->
  if
    C < GridSize ->
      NewC = C + 1,
      case maps:find({R, NewC}, Acc) of
        {ok, Cnt} ->
          Acc#{{R, NewC} := Cnt + Count};
        _ ->
          Acc#{{R, NewC} => Count}
      end;
    true ->
      Acc
  end.