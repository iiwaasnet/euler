%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. Sep 2019 13:54
%%%-------------------------------------------------------------------
-module(num_letters_17).
-author("iiwaasnet").

%% API
-export([run/1,
  spell_number/1]).

run(MaxNumber) ->
  spell_numbers(1, MaxNumber, 0).

spell_numbers(Number, MaxNumber, Acc) when Number =< MaxNumber ->
  Cnt = lists:sum([C || {_, C} <- spell_number(Number)]),
  spell_numbers(Number + 1, MaxNumber, Acc + Cnt);
spell_numbers(_, _, Acc) ->
  Acc.

spell_number(Number) when Number >= 0, Number < 20 ->
  case Number of
    0 ->
      [];
    1 ->
      [{"one", 3}];
    2 ->
      [{"two", 3}];
    3 ->
      [{"three", 5}];
    4 ->
      [{"four", 4}];
    5 ->
      [{"five", 4}];
    6 ->
      [{"six", 3}];
    7 ->
      [{"seven", 5}];
    8 ->
      [{"eight", 5}];
    9 ->
      [{"nine", 4}];
    10 ->
      [{"ten", 3}];
    11 ->
      [{"eleven", 6}];
    12 ->
      [{"twelve", 6}];
    13 ->
      [{"thirteen", 8}];
    14 ->
      [{"fourteen", 8}];
    15 ->
      [{"fifteen", 7}];
    16 ->
      [{"sixteen", 7}];
    17 ->
      [{"seventeen", 9}];
    18 ->
      [{"eighteen", 8}];
    19 ->
      [{"nineteen", 8}]
  end;
spell_number(Number) when Number >= 20, Number < 100, Number rem 10 =:= 0 ->
  case Number div 10 of
    2 ->
      [{"twenty", 6}];
    3 ->
      [{"thirty", 6}];
    4 ->
      [{"forty", 5}];
    5 ->
      [{"fifty", 5}];
    6 ->
      [{"sixty", 5}];
    7 ->
      [{"seventy", 7}];
    8 ->
      [{"eighty", 6}];
    9 ->
      [{"ninety", 6}]
  end;
spell_number(Number) when Number >= 20, Number < 100 ->
  lists:append(
    spell_number(Number div 10 * 10),
    spell_number(Number rem 10)
  );
spell_number(Number) when Number >= 100, Number < 1000 ->
  Tens = spell_number(Number rem 100),
  lists:append(
    lists:append(
      spell_number(Number div 100),
      [{"hundred", 7}]
    ),
    case Tens of
      [] ->
        [];
      _ ->
        [{"and", 3} | Tens]
    end
  );
spell_number(Number) when Number >= 1000, Number < 1000000 ->
  lists:append(
    lists:append(
      spell_number(Number div 1000),
      [{"thousand", 8}]
    ),
    spell_number(Number rem 1000)
  ).