-module(cards).
-export([make_deck/0]).
-include_lib("eunit/include/eunit.hrl").

make_deck_length_test() ->
  ?assertEqual(52, length(make_deck())).

make_deck_cards_test() ->
  {Numbers, Suits} = lists:unzip(make_deck()),
  ?assertEqual(["Clubs", "Diamonds", "Hearts", "Spades"], lists:usort(Suits)),
  ?assertEqual([2,3,4,5,6,7,8,9,10, "A", "J", "K", "Q"], lists:usort(Numbers)).

make_deck() ->
  FaceCards = ["J", "Q", "K"],
  Suits = ["Clubs", "Diamonds", "Hearts", "Spades"],
  [{X, Y} || X <- ["A" | lists:seq(2, 10)] ++ FaceCards, Y <- Suits].
