-module(ch5).
-export([number_or_string/1]).

%% 5.1. Show that the terminal object is unique up to unique isomorphism.
% Let's assume that there two terminal object A and B.
% By definition of terminal object we know that two functions let's call them for clarity f and g
% are going from A -f-> B and B -g-> A and there unique. We also know that composition of f after g gives
% us idB and the composition of g after f gives us idA.

%% 5.2. What is a product of two objects in a poset? Hint: Use the universal construction.

%% 5.4. Implementation of Either
-type either() :: {left, term()} | {right, term()}.

-spec number_or_string(either()) -> number | binary.
number_or_string({left, N}) -> N;
number_or_string({right, Str}) -> Str.
