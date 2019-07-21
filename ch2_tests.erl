-module(ch2_tests).
-include_lib("eunit/include/eunit.hrl").

%% Random function from erlang standard library memoized tests
uniform_memo_test() ->
  F = ch2:uniform_memo(),
  ?assertEqual(F(), F()).

%% Random function with seed memoized tests
uniform_with_seed_memo_test() ->
  F = ch2:uniform_with_seed_memo(),
  R1 = F(10),
  R2 = F(10),
  R3 = F(42),
  ?assertEqual(R1, R2),
  ?assertNotEqual(R1, R3).
