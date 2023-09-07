defmodule IsomorphicStrings205 do
  @moduledoc """

  https://leetcode.com/problems/isomorphic-strings/description/?envType=study-plan-v2&envId=top-interview-150

  Given two strings s and t, determine if they are isomorphic.

  Two strings s and t are isomorphic if the characters in s can be replaced to get t.

  All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

  Example 1:

  Input: s = "egg", t = "add"
  Output: true
  Example 2:

  Input: s = "foo", t = "bar"
  Output: false
  Example 3:

  Input: s = "paper", t = "title"
  Output: true


  Constraints:

  1 <= s.length <= 5 * 10^4
  t.length == s.length
  s and t consist of any valid ascii character.
  """

  @spec is_isomorphic(s :: String.t(), t :: String.t()) :: boolean
  def is_isomorphic(s, t) when s == t, do: true

  def is_isomorphic(s, t) do
    # Example mapping egg <-> add
    # %{
    #   "e" => "a",
    #   "g" => "d"
    # }

    Enum.zip(String.codepoints(s), String.codepoints(t))
    |> Enum.reduce_while(%{}, fn {s1, s2}, acc ->
      if Map.has_key?(acc, s1) do
        v1 = acc[s1]

        if v1 == s2 do
          {:cont, acc}
        else
          {:halt, nil}
        end
      else
        {:cont, Map.put(acc, s1, s2)}
      end
    end)
    |> check()
  end

  defp check(nil), do: false

  defp check(result) do
    result |> Map.keys() |> Enum.count() == result |> Map.values() |> Enum.uniq() |> Enum.count()
  end
end
