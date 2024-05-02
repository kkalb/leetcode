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

  @spec letter_combinations(digits :: String.t()) :: [String.t()]
  def letter_combinations(""), do: []

  def letter_combinations(digits) do
    <<first::bytes-size(1)>> <> rest = digits
    rest = String.graphemes(rest)

    Enum.reduce(rest, mapping(first), fn char, combinations ->
      new_letters = mapping(char)

      for comb <- combinations, new <- new_letters, do: comb <> new
    end)
  end

  defp mapping("2"), do: ["a", "b", "c"]
  defp mapping("3"), do: ["d", "e", "f"]
  defp mapping("4"), do: ["g", "h", "i"]
  defp mapping("5"), do: ["j", "k", "l"]
  defp mapping("6"), do: ["m", "n", "o"]
  defp mapping("7"), do: ["p", "q", "r", "s"]
  defp mapping("8"), do: ["t", "u", "v"]
  defp mapping("9"), do: ["w", "x", "y", "z"]
end
