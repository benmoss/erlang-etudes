-module(teeth).
-export([alert/1]).

-spec(alert(list()) -> list()).

alert(Teeth) ->
  alert(Teeth, [], 1).

alert([], Result, _) -> lists:reverse(Result);

alert([Tooth|Teeth], Result, Index) ->
  BadTooth = lists:any(fun(Reading) -> Reading > 3 end, Tooth),
  if
    BadTooth ->
      alert(Teeth, [Index | Result], Index + 1);
    true ->
      alert(Teeth, Result, Index + 1)
  end.





