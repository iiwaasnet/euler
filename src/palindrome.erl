%%%-------------------------------------------------------------------
%%% @author sivasenko
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%% Largest Palindrome Product
%%% @end
%%% Created : 29. Aug 2019 11:13
%%%-------------------------------------------------------------------
-module(palindrome).
-author("sivasenko").

%% API
-export([run/1]).

run(Arity) ->
  largest_palindrome_products(trunc(math:pow(10, Arity)) - 1, Arity).

largest_palindrome_products(Number, Arity) ->
  case find_highest_divider(Number, trunc(math:sqrt(Number)), Arity) of
    none ->
      Next = get_next_smaller_palindrome(Number, Arity),
      largest_palindrome_products(Next, Arity);
    Divider ->
      {Divider, Number div Divider}
  end.

find_highest_divider(Number, Divider, Arity) ->
  MinDivider = min_divider(Arity),
  MaxDivider = max_divider(Arity),
  if
    Divider =< MinDivider ->
      none;
    Divider > MinDivider ->
      if
        (Number rem Divider =:= 0) andalso (Number div Divider =< MaxDivider) ->
          Divider;
        true ->
          find_highest_divider(Number, Divider - 1, Arity)
      end
  end.

get_next_smaller_palindrome(Palindrome, Arity) ->
  HalfArity = Arity div 2,
  NextHalf = Palindrome div trunc(math:pow(10, HalfArity)) - 1,
  MinPalindromeHalf = trunc(math:pow(10, HalfArity - 1)),
  if
    NextHalf < MinPalindromeHalf ->
      none;
    NextHalf >= MinPalindromeHalf ->
      Mirrored = list_to_integer(lists:reverse(integer_to_list(NextHalf))),
      NextHalf * trunc(math:pow(10, HalfArity)) + Mirrored
  end.

min_divider(Arity) ->
  trunc(math:pow(10, (Arity div 2) - 1)).

max_divider(Arity) ->
  trunc(math:pow(10, (Arity div 2))) - 1.