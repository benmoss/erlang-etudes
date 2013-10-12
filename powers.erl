-module(powers).
-export([raise/2, nth_root/2]).

raise(_, 0) -> 1;
raise(X, 1) -> X;
raise(X, N) when N > 1 -> raise(X, N, 1);
% raise(X, N) when N > 1 -> X * raise(X, N-1);
raise(X, N) when N < 0 -> 1.0 / raise(X, -N).

raise(_, 0, Acc) ->
  Acc;

raise(X, N, Acc) when N > 0 ->
  raise(X, N-1, X*Acc).

nth_root(X, N) ->
  nth_root(X, N, X/2.0).

nth_root(X, N, A) ->
  F = raise(A, N) - X,
  Fprime = N * raise(A, N - 1),
  Next = A - F / Fprime,
  io:format("Current guess is ~w.~n", [Next]),
  Change = abs(Next - A),
  if
    Change < 1.0e-8 -> Next;
    true -> nth_root(X, N, Next)
  end.
