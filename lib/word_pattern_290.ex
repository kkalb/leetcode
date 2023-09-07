defmodule WordPattern290 do
  @moduledoc """

  https://leetcode.com/problems/word-pattern/?envType=study-plan-v2&envId=top-interview-150

  Given a pattern and a string s, find if s follows the same pattern.

  Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

  Example 1:

  Input: pattern = "abba", s = "dog cat cat dog"
  Output: true
  Example 2:

  Input: pattern = "abba", s = "dog cat cat fish"
  Output: false
  Example 3:

  Input: pattern = "aaaa", s = "dog cat cat dog"
  Output: false


  Constraints:

  1 <= pattern.length <= 300
  pattern contains only lower-case English letters.
  1 <= s.length <= 3000
  s contains only lowercase English letters and spaces ' '.
  s does not contain any leading or trailing spaces.
  All the words in s are separated by a single space.
  """

  @spec word_pattern(pattern :: String.t(), s :: String.t()) :: boolean

  def word_pattern(pattern, s) do
    sliced_str = String.split(s, " ")

    if String.length(pattern) == Enum.count(sliced_str) do
      check_word_pattern(pattern, sliced_str)
    else
      false
    end
  end

  defp check_word_pattern(pattern, sliced_str) do
    pattern_list = String.to_charlist(pattern)

    [pattern_list, sliced_str]
    |> Enum.zip()
    |> Enum.reduce_while(%{}, fn {pattern_ele, s_ele}, acc ->
      case Map.fetch(acc, pattern_ele) do
        {:ok, existing_ele} when existing_ele == s_ele ->
          {:cont, acc}

        {:ok, _existing_ele} ->
          {:halt, nil}

        :error ->
          on_not_found(acc, pattern_ele, s_ele)
      end
    end)
    |> check_result()
  end

  defp on_not_found(acc, pattern_ele, s_ele) do
    if s_ele in Map.values(acc) do
      {:halt, nil}
    else
      {:cont, Map.put(acc, pattern_ele, s_ele)}
    end
  end

  defp check_result(nil), do: false

  defp check_result(_result), do: true
end
