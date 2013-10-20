-module(dates).
-export([date_parts/1]).


-spec(date_parts(list()) -> list()).

date_parts(String) ->
  Tokens = string:tokens(String, "-"),
  lists:map(fun(X) -> element(1, string:to_integer(X)) end, Tokens).
