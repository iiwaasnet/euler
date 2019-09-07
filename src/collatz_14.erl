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
  erlang:display(erlang:localtime()),
  LongestRoute = find_longest_route(MaxValue),
  erlang:display(erlang:localtime()),
  io:fwrite("Lenght: ~B StartValue: ~B~n", [LongestRoute#route.length, LongestRoute#route.start_value]).

find_longest_route(MaxValue) ->
  find_longest_route((MaxValue - 1) div 3, MaxValue, #{}, #route{start_value = 1}).

find_longest_route(RouteStartValue, MaxValue, _, LongestRoute) when RouteStartValue >= MaxValue ->
  LongestRoute;
find_longest_route(RouteStartValue, MaxValue, RoutesCache, LongestRoute) when RouteStartValue < MaxValue ->
  {Cache, Route} = find_route_length(#route{start_value = RouteStartValue}, RouteStartValue, RoutesCache),
  find_longest_route(
    RouteStartValue + 1,
    MaxValue,
    Cache,
    take_longest_route(Route, LongestRoute)
  ).

take_longest_route(#route{start_value = _, length = LLength} = Left, #route{start_value = _, length = RLength} = _) when LLength > RLength ->
  Left;
take_longest_route(_, Right) ->
  Right.

find_route_length(Route, CurrentValue, RoutesCache) when CurrentValue =:= 1 ->
  {
    RoutesCache#{Route#route.start_value => Route#route.length},
    Route
  };
find_route_length(#route{start_value = _, length = Len} = Route, CurrentValue, RoutesCache) when CurrentValue > 1 ->
  case RoutesCache of
    {CurrentValue, CachedRouteLength} ->
      find_route_length(Route#route{length = Len + CachedRouteLength - 1}, 1, RoutesCache);
    _ ->
      case CurrentValue rem 2 of
        0 ->
          find_route_length(Route#route{length = Len + 1}, CurrentValue div 2, RoutesCache);
        _ ->
          find_route_length(Route#route{length = Len + 1}, CurrentValue * 3 + 1, RoutesCache)
      end
  end.