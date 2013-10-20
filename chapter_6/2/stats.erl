-module(stats).
-export([minimum/1, maximum/1, range/1]).

maximum(Numbers) ->
  [Head|Tail] = Numbers,
  maximum(Head, Tail).

-spec(maximum(list()) -> integer()).
maximum(Result, []) -> Result;
maximum(Candidate, Numbers) ->
  [Head|Tail] = Numbers,
  maximum(Candidate, Head, Tail).

maximum(N1, N2, Numbers) when N1 < N2 ->
  maximum(N2, Numbers);

maximum(N1, _, Numbers) ->
  maximum(N1, Numbers).

-spec(minimum(list()) -> integer()).
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

-spec(range(list()) -> list()).
range(Numbers) ->
  [minimum(Numbers), maximum(Numbers)].
