defmodule LetterCombination17Test do
  use ExUnit.Case
  alias LetterCombination17

  test "Case 1" do
    s = "23"

    assert LetterCombination17.letter_combinations(s) == [
             "ad",
             "ae",
             "af",
             "bd",
             "be",
             "bf",
             "cd",
             "ce",
             "cf"
           ]
  end

  test "Case 2" do
    s = ""

    assert LetterCombination17.letter_combinations(s) == []
  end

  test "Case 3" do
    s = "2"

    assert LetterCombination17.letter_combinations(s) == ["a", "b", "c"]
  end
end
