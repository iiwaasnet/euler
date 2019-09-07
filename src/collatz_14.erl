%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Sep 2019 19:31
%%%-------------------------------------------------------------------
-module(collatz_14).
-include("collatz_14.hrl").
-author("iiwaasnet").

%% API
-export([run/1]).

run(MaxValue) ->
  LongestRoute = lists:max(find_all_routes(MaxValue)),
  _ = io:fwrite("Lenght: ~B StartValue: ~B~n", [LongestRoute#route.length, LongestRoute#route.start_value]).

find_all_routes(MaxValue) ->
  find_all_routes(2, MaxValue, dict:new(), []).

find_all_routes(RouteStartValue, MaxValue, _, Acc) when RouteStartValue >= MaxValue ->
  Acc;
find_all_routes(RouteStartValue, MaxValue, RoutesCache, Acc) when RouteStartValue < MaxValue ->
  {Cache, Route} = find_route_length(#route{start_value = RouteStartValue}, RouteStartValue, RoutesCache),
  find_all_routes(
    RouteStartValue + 1,
    MaxValue,
    Cache,
    [Route | Acc]
  ).

find_route_length(Route, CurrentValue, RoutesCache) when CurrentValue =:= 1 ->
  {
    dict:append(Route#route.start_value, Route#route.length, RoutesCache),
    Route
  };
find_route_length(#route{start_value = _, length = Len} = Route, CurrentValue, RoutesCache) when CurrentValue > 1 ->
  case dict:find(CurrentValue, RoutesCache) of
    {ok, [CachedRouteLength | _]} ->
      %%io:fwrite("cache hit at: ~B~n", [CurrentValue]),
      find_route_length(Route#route{length = Len + CachedRouteLength - 1}, 1, RoutesCache);
    _ ->
      case CurrentValue rem 2 of
        0 ->
          find_route_length(Route#route{length = Len + 1}, CurrentValue div 2, RoutesCache);
        _ ->
          find_route_length(Route#route{length = Len + 1}, CurrentValue * 3 + 1, RoutesCache)
      end
  end.