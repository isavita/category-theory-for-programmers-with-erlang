-module(ch3).
-compile(export_all).

%% 3.1. Generate a free category from
%% 3.1.a. A graph with one node and no edges
% It has only identity arrow.

%% 3.1.b. A graph with one node and one edge
% A -f-> A. It has arrow for f, f.f, f.f.f etc.
f(a) -> a;

%% 3.1.c. A graph with two nodes and a single arrow between them
% B -f-> A. It cannot compose f. Not possible to create category.
f(b) -> a.

%% 3.1.d. A graph with single node and 26 arrows
% A -a-> A, A -b-> A, ..., A -z-> A.

%% 3.2. What kind of order is this?
%% 3.2.a. A set of sets with the inclusion relation:
%% A is included in B if every element of A is also an element of B.
% It is partial order because if A is included in B and B is included in A therefore A and B are the same set.
% It is not total order because there might be sets that are not in inclusion relation between each other both
% contain elements that do not overlap.

%% 3.2.b. C++ types with the following subtyping relation: T1 is a
%% subtype of T2 if a pointer to T1 can be passed to a function
%% that expects a pointer to T2 without triggering a compilation error.
% I think this is preorder because I don't think that if A is subtype on B and B is subtype on A that apply that
% A and B are equal (e.g. A -sub-> B && B -sub-> A does not apply A = B)

%% 3.3. Considering that Bool is a set of two values True and False,
%% show that it forms two (set-theoretical) monoids with respect to, respectively, operator && (AND) and || (OR).
% 1.And. It has id_and
id_and(A) -> A andalso true.
% 2.And. It is composible and associative
% 1.Or. It has id_or
id_or(A) -> A orelse false.
% 2.Or. It is composible and associative
