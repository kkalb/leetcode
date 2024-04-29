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

  @spec is_subsequence(String.t(), String.t()) :: boolean
  # Just problem definitions: when s is empty, its always a substring of t. When t is empty and s is not, it can never be a substring.
  def is_subsequence(<<_char_s::binary-size(0)>>, _t), do: true
  def is_subsequence(_s, <<_char_t::binary-size(0)>>), do: false

  # when chars match, we use the charlists without the chars as heads
  def is_subsequence(
        <<char_s::binary-size(1)>> <> rest_s,
        <<char_t::binary-size(1)>> <> rest_t
      )
      when char_t == char_s,
      do: is_subsequence(rest_s, rest_t)

  # when chars do not match, we go on with the next iteration of t while keeping the current head of s
  def is_subsequence(s, <<_char_t::binary-size(1)>> <> rest_t),
    do: is_subsequence(s, rest_t)
end
