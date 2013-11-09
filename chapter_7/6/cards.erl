-module(cards).
-export([shuffle/1]).

-spec(shuffle([card()]) -> [card()]).

% Begin by creating an accumulator to move shuffled cards into
shuffle(List) -> shuffle(List, []).

% The final recursion will return the shuffled cards.
shuffle([], Acc) -> Acc;

% 1. Split the deck at a random point
% 2. Take the top card from the bottom half of the split
%    and place it on top of the accumulator.
% 3. Recur with the rest of the unshuffled cards until the list is empty.
shuffle(List, Acc) ->
  {Leading, [H | T]} = lists:split(random:uniform(length(List)) - 1, List),
  shuffle(Leading ++ T, [H | Acc]).
