defmodule LetterCombination17 do
  @moduledoc """

  https://leetcode.com/problems/letter-combinations-of-a-phone-number/?envType=study-plan-v2&envId=top-interview-150

  Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

  A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.


  Example 1:

  Input: digits = "23"
  Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
  Example 2:

  Input: digits = ""
  Output: []
  Example 3:

  Input: digits = "2"
  Output: ["a","b","c"]


  Constraints:

  0 <= digits.length <= 4
  digits[i] is a digit in the range ['2', '9'].
  """

  @digit_to_letters %{
    "2" => ["a", "b", "c"],
    "3" => ["d", "e", "f"],
    "4" => ["g", "h", "i"],
    "5" => ["j", "k", "l"],
    "6" => ["m", "n", "o"],
    "7" => ["p", "q", "r", "s"],
    "8" => ["t", "u", "v"],
    "9" => ["w", "x", "y", "z"]
  }

  @spec letter_combinations(digits :: String.t()) :: [String.t()]
  def letter_combinations(""), do: []

  def letter_combinations(digits) do
    letters =
      digits
      # string to list has linear time complexity O(n)
      |> String.graphemes()
      # mapping each element in the list has time complexity of O(n)
      |> Enum.map(
        # fixed size map lookup has constant time complexity O(1)
        &Map.get(@digit_to_letters, &1)
      )

    # time compelxity constant for first element O(1)
    [first | rest] = letters

    # until here we have time complexity of 2 * O(n), which is small against the following functions
    # iterating over (n-1) elements where n is string input length, means O(n-1)
    # for every element, we iterate over combinations, which is O(m*k)
    # where m is the current list of combinations and k is 3 or 4 (with worst case its 4).
    # resulting in O(m*k*n-1)
    Enum.reduce(rest, first, fn char, combinations ->
      for comb <- combinations, new <- char, do: comb <> new
    end)
  end
end
