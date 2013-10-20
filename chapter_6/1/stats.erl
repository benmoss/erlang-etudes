-module(stats).
-export([minimum/1]).

minimum(Numbers) ->
  [Head|Tail] = Numbers,
  minimum(Head, Tail).

minimum(Result, []) -> Result;
minimum(Candidate, Numbers) ->
  [Head|Tail] = Numbers,
  minimum(Candidate, Head, Tail).

minimum(N1, N2, Numbers) when N1 < N2 ->
  minimum(N1, Numbers);

minimum(_, N2, Numbers) ->
  minimum(N2, Numbers).
