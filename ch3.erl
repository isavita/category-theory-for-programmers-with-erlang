-module(ch3).
-compile(export_all).

% 3.1. Generate a free category from
% 3.1.a. A graph with one node and no edges
% It has only identity arrow
% 3.1.b. A graph with one node and one edge
% A -f-> A. It has arrow for f, f.f, f.f.f etc.
f(a) -> a;
% 3.1.c. A graph with two nodes and a single arrow between them
% B -f-> A. It cannot compose f. Not possible to create category.
f(b) -> a.
% 3.1.d. A graph with single node and 26 arrows
% A -a-> A, A -b-> a, ..., A -z-> A.
mempty() -> "".
mappend(X, X) when is_list(X) -> X.
