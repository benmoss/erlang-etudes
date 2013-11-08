-module(stats).
-export([mean/1, stdv/1]).

mean(Numbers) ->
  Sum = lists:foldl(fun erlang:'+'/2, 0, Numbers),
  Sum / length(Numbers).

stdv(Numbers) ->
  N = length(Numbers),
  Sum = lists:foldl(fun erlang:'+'/2, 0, Numbers),
  SumOfSquares = lists:foldl(fun(X, Acc) -> X * X + Acc end, 0, Numbers),
  Something = N * SumOfSquares,
  SumSquared = Sum * Sum,
  SomethingElse = Something - SumSquared,
  WowMoreStuff = SomethingElse / (N * (N - 1)),
  math:sqrt(WowMoreStuff).
