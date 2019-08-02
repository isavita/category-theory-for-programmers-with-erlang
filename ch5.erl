-module(ch5).
-export([number_or_string/1]).

%% 5.1. Show that the terminal object is unique up to unique isomorphism.
% Let's assume that there two terminal object A and B.
% By definition of terminal object we know that two functions let's call them for clarity f and g
% are going from A -f-> B and B -g-> A and there unique. We also know that composition of f after g gives
% us idB and the composition of g after f gives us idA. Because there can be only one morphism from A to A
% that means that composition of f after g is equivalent of the identity the same apply for B.

%% 5.2. What is a product of two objects in a poset? Hint: Use the universal construction.
% The product, if it exists, is the greatest lower bound.

%% 5.3. What is a coproduct of two objects in a poset?
% The coproduct, if it exists, is the least upper bound.

%% 5.4. Implementation of Either
-type either() :: {left, term()} | {right, term()}.

-spec number_or_string(either()) -> number | binary.
number_or_string({left, N}) -> N;
number_or_string({right, Str}) -> Str.

%% 5.5.  Show that Either is a “better” coproduct than int equipped with
%% two injections:
%% int i(int n) { return n; }
%% int j(bool b) { return b? 0: 1; }
%% Hint: Define a function
-spec m(either()) -> number.
m({left, N}) -> N;
m({left, true}) -> 1;
m({left, false}) -> 0;
