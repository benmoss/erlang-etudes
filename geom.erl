%% @author Ben Moss
%% @doc Some math and shit
%% @copyright 2013
%% @version 1.0

-module(geom).
-export([area/1]).

area({Shape, X, Y}) when X >= 0, Y >= 0 ->
  case Shape of
    rectangle -> X * Y;
    triangle -> X * Y / 2.0;
    ellipse -> math:pi() * X * Y
  end.
