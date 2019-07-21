-module(ch1_tests).
-include_lib("eunit/include/eunit.hrl").

%% Identity function tests
id_test() ->
  ?assertEqual(42, ch1:id(42)),
  ?assertEqual("the answer", ch1:id(ch1:id("the answer"))).

%% Composition function tests
comp_test() ->
  Add2 = fun(X) -> X + 2 end,
  Double = fun(X) -> X * X end,
  ?assertEqual(Double(Add2(4)), (ch1:comp(Double, Add2))(4)),
  ?assertEqual(
    string:words(string:uppercase("The answer to life")),
    (ch1:comp(fun string:words/1, fun string:uppercase/1))("The answer to life")
  ).

%% Identity function is composible tests
composible_identity_test() ->
  IdComp = ch1:comp(fun ch1:id/1, fun ch1:id/1),
  ?assertEqual(42, IdComp(42)),
  ?assertEqual(true, IdComp(true)).
