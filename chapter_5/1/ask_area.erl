-module(ask_area).
-export([area/0]).

area() ->
  Type = to_type(get_line("R)ectangle, T)riangle, or E)llipse > ")),
  Width = to_numeric(get_line("Enter width > ")),
  Height = to_numeric(get_line("Enter height > ")),
  calculate(Type, Width, Height).

to_type("r") ->
  rectangle;
to_type("t") ->
  triangle;
to_type("e") ->
  ellipse;
to_type(Unknown) ->
  io:format("Unknown shape ~s~n", [Unknown]), error.

get_line(Prompt) ->
  string:to_lower(string:strip(io:get_line(Prompt), right, $\n)).

to_numeric(String) ->
  {Result, _} = case string:to_float(String) of
    {error, _} -> string:to_integer(String);
    {Float, _} -> Float
  end,
  case Result of
    error ->
      io:format("Invalid number ~s~n", [String]), error;
    _ -> Result
  end.

calculate(error, _, _) -> ok;
calculate(_, error, _) -> ok;
calculate(_, _, error) -> ok;
calculate(Type, Width, Height) when Width >= 0, Height >= 0 ->
  geom:area({Type, Width, Height});
calculate(_, _, _) ->
  io:format("Both numbers must be greater than or equal to zero.~n").
