-module(comprehension).

-export([dudes_over_40/1, dudes_or_over_40/1]).

dudes_over_40(People) ->
  [Person || Person = {_, Gender, Age} <- People, Age > 40, Gender == $M].

dudes_or_over_40(People) ->
  [Person || Person = {_, Gender, Age} <- People, Age > 40 orelse Gender == $M].
