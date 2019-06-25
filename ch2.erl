-module(ch2).
-compile(export_all).

% 2.1. Memoize function
memoize(F) ->
  FunId = fun_id(F),
  case lists:member(FunId, ets:all()) of
    false -> ets:new(FunId, [set, named_table]);
    _ -> memoize_fun
  end,
  memoized_fun(F).

% 2.2. Random function memoized
uniform_memo() -> memoize(fun random:uniform/0).

% 2.3. Random function with seed memoized
uniform_with_seed_memo() -> memoize(fun uniform_with_seed/1).
uniform_with_seed(Seed) ->
  SeedValue = random:seed(Seed),
  {Value, _} = random:uniform_s(SeedValue),
  Value.

% 2.4. Memoize this functions
% a. It is pure function
fib(0) -> 0;
fib(1) -> 1;
fib(N) when N > 0 -> fib(N-1) + fib(N-2).
% b. It has different output with the same input
getchar() ->
  io:fread("Prompt> ", "~s").
% c. It does not have same behaviour once memoized due to side thus not pure
f() ->
  io:fwrite("Hello!"),
  true.

% 2.5. All boolean to boolean functions
f_bool1(false) -> true;
f_bool1(true) -> true.
f_bool2(false) -> false;
f_bool2(true) -> false.
f_bool3(false) -> true;
f_bool3(true) -> false.
f_bool4(false) -> false;
f_bool4(true) -> true.

% 2.6. Draw a picture of a category whose only objects are the types Void , () (unit), and Bool.
unit_id() -> unit.
void_id() -> void.
bool_id(X) -> X.
unit_to_true() -> true.
unit_to_false() -> false.
bool_to_unit(false) -> unit;
bool_to_unit(true) -> unit.
void() -> everything.

% Helper functions
fun_id(F) ->
  {name, Name} = erlang:fun_info(F, name),
  {module, Module} = erlang:fun_info(F, module),
  Arity = fun_arity(F),
  Id = erlang:atom_to_list(Module) ++ erlang:atom_to_list(Name) ++ "-Arity-" ++ erlang:integer_to_list(Arity),
  list_to_atom(Id).

fun_arity(F) ->
  {arity, N} = erlang:fun_info(F, arity),
  N.

memoized_fun(F) ->
  FunId = fun_id(F),
  case fun_arity(F) of
    0 ->
      fun() ->
        case ets:lookup(FunId, {}) of
          [{_, Value}] -> Value;
          _ ->
            Value = F(),
            ets:insert(FunId, {{}, Value}),
            Value
        end
      end;
    1 ->
      fun(X) ->
        FunId = fun_id(F),
        case ets:lookup(FunId, {X}) of
          [{_, Value}] -> Value;
          _ ->
            Value = F(X),
            ets:insert(FunId, {{X}, Value}),
            Value
        end
      end;
    2 ->
      fun(X, Y) ->
        FunId = fun_id(F),
        case ets:lookup(FunId, {X, Y}) of
          [{_, Value}] -> Value;
          _ ->
            Value = F(X, Y),
            ets:insert(FunId, {{X, Y}, Value}),
            Value
        end
      end;
    _ ->
      not_supported_arity
  end.
