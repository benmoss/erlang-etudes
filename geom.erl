%% @author Ben Moss
%% @doc Some math and shit
%% @copyright 2013
%% @version 1.0

-module(geom).
-export([area/2]).

%% @doc call this if u want area for a rectangle
-spec(area(number(), number()) -> number()).

area(Length, Width) -> Length * Width.
