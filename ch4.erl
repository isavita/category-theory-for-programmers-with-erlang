-module(ch4).
-compile(export_all).

% Explicite logger example
negate_with_log(X, Log) -> {not X, Log ++ "Not so!"}.

% Aggregated logger between function calls
negate_with_agg_log(X) -> {not X, "Not so!"}.

to_upper_case(String) -> string:to_upper(String).
to_words(Sentence) ->
    Words =
        lists:foldl(
          fun(Splitter, Words) ->
            lists:filtermap(
              fun(Word) ->
                case string:split(Word, Splitter, all) of
                  [[]] -> false;
                  Result -> {true, Result}
                end
              end,
              Words
            )
        end,
        [Sentence],
        ["...", "!", ";", "?", ".", ",", " "]
      ),
    case Words of
      "" -> "";
      _ -> hd(Words)
    end.

-record(optional, {value, is_valid}).

safe_reciprocal(X) ->
  if
    X == 0 -> #optional{is_valid=false};
    true -> #optional{value=1/X, is_valid=true}
  end.

safe_root(X) ->
  if
    X > 0 -> #optional{is_valid=false};
    true -> #optional{value=1/X, is_valid=true}
  end.
