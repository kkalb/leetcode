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
    if String.length(s) != String.length(t) do
      false
    else
      is_isomorphic_complex(s, t)
    end
  end

  defp is_isomorphic_complex(s, t) do
    # Example mapping egg <-> add
    # %{
    #   "e" => "a",
    #   "g" => "d"
    # }
    [String.codepoints(s), String.codepoints(t)]
    |> Enum.zip()
    |> create_mapping()
    |> check()
  end

  defp create_mapping(zipped_lists) do
    zipped_lists
    |> Enum.reduce_while(%{}, fn {s1, s2}, acc ->
      case Map.fetch(acc, s1) do
        {:ok, v1} when v1 == s2 -> {:cont, acc}
        :error -> {:cont, Map.put(acc, s1, s2)}
        _ -> {:halt, nil}
      end
    end)
  end

  defp check(nil), do: false

  defp check(result) do
    result |> Map.keys() |> Enum.count() == result |> Map.values() |> Enum.uniq() |> Enum.count()
  end
end
