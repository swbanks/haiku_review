-module(haiku_tests).
-include_lib("eunit/include/eunit.hrl").
-import(haiku, [answer/0]).

each_line_has_a_single_word_with_a_single_syllable_test() ->
  Result = haiku:haiku_test("the/farm/stinks"),
  ?assertEqual([1,1,1,"no"], Result).

is_valid_haiku_test() ->
  Result = haiku:haiku_test("happy purple frog/eating bugs in the marshes/get indigestion"),
  ?assertEqual([5,7,5,"yes"], Result).

off_by_one_in_second_word_test() ->
  Result = haiku:haiku_test("computer programs/the bugs try to eat my code/i will not let them"),
  ?assertEqual([5,8,5,"no"], Result).

remove_leading_consonants_test() ->
  ?assertEqual("eiou", haiku:remove_leading_consonants("zxcvbeiou")).

no_leading_consonants_test() ->
  ?assertEqual("ebbnx", haiku:remove_leading_consonants("ebbnx")).

remove_leading_vowels_test() ->
  ?assertEqual("nimal", haiku:remove_leading_vowels("aaaaiiinimal")).

no_leading_vowels_test() ->
  ?assertEqual("noleadingvowels", haiku:remove_leading_vowels("noleadingvowels")).
