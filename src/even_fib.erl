%%%-------------------------------------------------------------------
%%% @author iiwaasnet
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Aug 2019 19:57
%%%-------------------------------------------------------------------
-module(even_fib).
-author("iiwaasnet").

%% API
-export([run/1]).

run(UpperBound) ->
  lists:sum([X || X <- fibonacci(UpperBound), X rem 2 == 0]).

fibonacci(UpperBound) ->
  lists:reverse(fibonacci_gen(lists:reverse([1, 2]), UpperBound)).

fibonacci_gen(Sequence, UpperBound) ->
  [H1|[H2|_]] = Sequence,
  NewHead = H1 + H2,
  if
    NewHead > UpperBound -> Sequence;
    NewHead =< UpperBound -> fibonacci_gen([NewHead|Sequence], UpperBound)
  end.
