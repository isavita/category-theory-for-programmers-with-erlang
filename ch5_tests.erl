-module(ch5_tests).
-include_lib("eunit/include/eunit.hrl").

%% Either tests
number_or_string_test() ->
  ?assertEqual(42, ch5:number_or_string({left, 42})),
  ?assertEqual("my lucky phrase", ch5:number_or_string({right, "my lucky phrase"})).
