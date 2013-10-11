%% @author Ben Moss
%% @doc Some math and shit
%% @copyright 2013
%% @version 1.0

-module(geom).
-export([area/1]).

area({Planet, X, Y}) -> area(Planet, X, Y).

area(rectangle, Length, Width) when Length >= 0, Width >= 0 -> Length * Width;
area(triangle, Base, Height) when Base >= 0, Height >= 0 -> Base * Height / 2.0;
area(ellipse, Major, Minor) when Major >= 0, Minor >= 0 -> math:pi() * Major * Minor;
area(_, _, _) -> 0.

