-module(dates).
-export([julian/1]).


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
  {PrecedingMonths, _} = lists:split(M - 1, DaysPerMonth),
  lists:foldl(fun erlang:'+'/2, 0, [D | PrecedingMonths]).

is_leap_year(Year) ->
  (Year rem 4 == 0 andalso Year rem 100 /= 0)
  orelse (Year rem 400 == 0).
