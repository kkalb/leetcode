defmodule IsSubsequence392 do
  @moduledoc """

  https://leetcode.com/problems/is-subsequence/?envType=study-plan-v2&envId=top-interview-150

  Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

  A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

  Example 1:

  Input: s = "abc", t = "ahbgdc"
  Output: true
  Example 2:

  Input: s = "axc", t = "ahbgdc"
  Output: false


  Constraints:

  0 <= s.length <= 100
  0 <= t.length <= 104
  s and t consist only of lowercase English letters.


  Follow up: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 109, and you want to check one by one to see if t has its subsequence. In this scenario, how would you change your code?
  """

  defmacro act(char_t, char_s, rest) do
    quote do
      cond do
        # When char_t equals char_s and rest is empty
        unquote(char_t) == unquote(char_s) and is_list(unquote(rest)) and unquote(rest) == [] ->
          {:halt, []}

        # When char_t does not equal char_s and rest is empty
        unquote(char_t) != unquote(char_s) and is_list(unquote(rest)) and unquote(rest) == [] ->
          {:cont, [unquote(char_s)]}

        # When char_t equals char_s and rest is not empty
        unquote(char_t) == unquote(char_s) and is_list(unquote(rest)) ->
          {:cont, unquote(rest)}

        # When char_t does not equal char_s and rest is not empty
        unquote(char_t) != unquote(char_s) and is_list(unquote(rest)) ->
          {:cont, [unquote(char_s) | unquote(rest)]}
      end
    end
  end

  @spec is_subsequence(s :: String.t(), t :: String.t()) :: boolean
  def is_subsequence(s, t) do
    solve(to_charlist(s), to_charlist(t))
  end

  defp solve([], _), do: true
  defp solve(_, []), do: false

  defp solve([char_s | rest_s], [char_t | rest_t]) do
    case act(char_t, char_s, rest_s) do
      {:halt, []} -> true
      {:cont, new_rest} -> solve(new_rest, rest_t)
    end
  end
end
