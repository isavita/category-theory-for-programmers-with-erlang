-module(ch1).

-export([id/1, comp/2, comp_id_test/1]).

% 1.1. Implement identity function
id(X) -> X.

% 1.2. Implement composition function
comp(G, F) -> fun(X) -> G(F(X)) end.

% 1.3. Test that composition function respect identity
comp_id_test(X) -> X =:= comp_id(X).
comp_id(X) -> (comp(fun id/1, fun id/1))(X).
