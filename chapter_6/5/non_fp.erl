-module(non_fp).
-export([generate_teeth/2]).

-spec(generate_teeth(list(), float()) -> list()).

generate_teeth(Instructions, ProbabilityOfGoodness) ->
  generate_teeth(Instructions, ProbabilityOfGoodness, []).


generate_teeth([], _, Result) -> lists:reverse(Result);
generate_teeth([Instruction|Instructions], ProbabilityOfGoodness, Result) ->
  Tooth = generate_tooth(Instruction, ProbabilityOfGoodness, []),
  generate_teeth(Instructions, ProbabilityOfGoodness, [Tooth|Result]).

generate_tooth($T, ProbabilityOfGoodness, Result) when length(Result) < 4 ->
  Rand = random:uniform(ProbabilityOfGoodness * 8 + 4) - 1,
  ProbablyRand = round(Rand + Rand * ProbabilityOfGoodness),
  case ProbablyRand > 4 of
    true -> generate_tooth($T, ProbabilityOfGoodness, [4 | Result]);
    false -> generate_tooth($T, ProbabilityOfGoodness, [ProbablyRand | Result])
  end;
generate_tooth($T, _, Result) -> Result;
generate_tooth($F, _, _) -> [0].
