-module(haiku).
-export([haiku_test/1, remove_leading_consonants/1, remove_leading_vowels/1]).

haiku_test(TheHaiku) ->
  LinesOfHaiku = string:tokens(TheHaiku, "/"),
  test_all_lines(LinesOfHaiku, []).

test_all_lines([], [5,7,5] = Answer) ->
  Answer ++ ["yes"];
test_all_lines([], Answer) ->
  Answer ++ ["no"];
test_all_lines([Line | RestOfLines], Answer) ->
  WordsInALine = string:tokens(Line, " "),
  SyllablesInLine = test_individual_line(WordsInALine, 0),
  test_all_lines(RestOfLines, Answer ++ [SyllablesInLine]).

test_individual_line([], Syllables) ->
  Syllables;
test_individual_line([Word | RestOfWords], SyllablesSoFar)->
  CumulativeSyllables = SyllablesSoFar + test_individual_word(Word, 0),
  test_individual_line(RestOfWords, CumulativeSyllables ).
  
test_individual_word("", Syllables) ->
  Syllables;
test_individual_word(Word, Syllables) ->
  ParsedOnce = remove_leading_consonants(Word),
  ParsedTwice = remove_leading_vowels(ParsedOnce),
  ParsedThrice = remove_leading_consonants(ParsedTwice),
  test_individual_word(ParsedThrice, Syllables + 1).

remove_leading_consonants(Word) ->
  Consonants = "bcdfghjklmnpqrstvwxz",
  string:substr(Word, string:span(Word, Consonants) + 1).

remove_leading_vowels(Word) ->
  Vowels = "aeiouy",
  string:substr(Word, string:span(Word, Vowels) + 1).
