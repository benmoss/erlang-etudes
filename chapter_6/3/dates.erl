-module(dates).
-export([date_parts/1, julian/1]).


-spec(date_parts(string()) -> string()).
date_parts(String) ->
  Tokens = string:tokens(String, "-"),
  lists:map(fun(X) -> element(1, string:to_integer(X)) end, Tokens).

-spec(julian(string()) -> string()).
julian(String) ->
  [Y, M, D] = date_parts(String),
  DaysInFeb = case is_leap_year(Y) of
    true -> 29;
    false -> 28
  end,
  DaysPerMonth = [31, DaysInFeb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
  julian(Y, M, D, DaysPerMonth, 0).

julian(Y, M, D, DaysPerMonth, Acc) when M > (13 - length(DaysPerMonth)) ->
  [Head|Tail] = DaysPerMonth,
  julian(Y, M, D, Tail, Head + Acc);

julian(_, _, D, _, Acc) -> D + Acc.

is_leap_year(Year) ->
  (Year rem 4 == 0 andalso Year rem 100 /= 0)
  orelse (Year rem 400 == 0).
