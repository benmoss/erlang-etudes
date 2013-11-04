-module(calculus).
-export([derivative/2]).

derivative(Fn, Point) ->
  Delta = 1.0e-10,
  (Fn(Point + Delta) - Fn(Point)) / Delta.
