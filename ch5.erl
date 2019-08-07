-module(ch5).
-export([number_or_string/1, m/1]).

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
m({right, true}) -> 1;
m({right, false}) -> 0.

%% 5.6. Continuing the previous problem: How would you argue that int
%% with the two injections i and j cannot be “better” than Either ?
% The reason is the when we map to int instead of Either we are losing information.
% Therefore we do not have way to invert the injection due to the fact that the boolean
% values have been map to integer and at the same time we have integer that are going to same
% values. Thus the injections i and j to int cannot be "better" than Either.

%% 5.7. Still continuing: What about these injections?
%% int i(int n) { if (n < 0) return n; return n + 2; }
%% int j(bool b) { return b? 0: 1; }
% The same apply for the above injection if we are talking for finite sets, which is the case of int in C++.
% The reasons is due to the fact that our initial values are N + 2 (N integers and two boolean values) but the
% result set is only N. The "lost" is caused by ((max:int - 1) + 2) and (max:int + 2)
% they actually map to (min:int) and (min:int -1).
