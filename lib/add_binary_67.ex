defmodule AddBinary67 do
  @moduledoc """

  https://leetcode.com/problems/add-binary/?envType=study-plan-v2&envId=top-interview-150

  Given two binary strings a and b, return their sum as a binary string.



  Example 1:

  Input: a = "11", b = "1"
  Output: "100"
  Example 2:

  Input: a = "1010", b = "1011"
  Output: "10101"


  Constraints:

  1 <= a.length, b.length <= 104
  a and b consist only of '0' or '1' characters.
  Each string does not contain leading zeros except for the zero itself.
  """

  @spec add_binary(a :: String.t(), b :: String.t()) :: String.t()
  def add_binary("0", "0"), do: "0"
  def add_binary(a, "0"), do: a
  def add_binary("0", b), do: b
  def add_binary(a, b), do: solve(String.reverse(a), String.reverse(b), 0, "")

  defp solve("", "0" <> b_rest, 1, res), do: solve("", b_rest, 0, "1" <> res)
  defp solve("0" <> a_rest, "", 1, res), do: solve(a_rest, "", 0, "1" <> res)
  defp solve("", "1" <> b_rest, 1, res), do: solve("", b_rest, 1, "0" <> res)
  defp solve("1" <> a_rest, "", 1, res), do: solve(a_rest, "", 1, "0" <> res)

  defp solve("", "0" <> b_rest, 0, res), do: solve("", b_rest, 0, "0" <> res)
  defp solve("0" <> a_rest, "", 0, res), do: solve(a_rest, "", 0, "0" <> res)
  defp solve("", "1" <> b_rest, 0, res), do: solve("", b_rest, 0, "1" <> res)
  defp solve("1" <> a_rest, "", 0, res), do: solve(a_rest, "", 0, "1" <> res)

  defp solve("", "", 1, res), do: "1" <> res
  defp solve("", "", 0, res), do: res
  defp solve("0" <> a_rest, "0" <> b_rest, 1, res), do: solve(a_rest, b_rest, 0, "1" <> res)
  defp solve("0" <> a_rest, "0" <> b_rest, 0, res), do: solve(a_rest, b_rest, 0, "0" <> res)
  defp solve("1" <> a_rest, "1" <> b_rest, 1, res), do: solve(a_rest, b_rest, 1, "1" <> res)
  defp solve("1" <> a_rest, "1" <> b_rest, 0, res), do: solve(a_rest, b_rest, 1, "0" <> res)
  defp solve("0" <> a_rest, "1" <> b_rest, 1, res), do: solve(a_rest, b_rest, 1, "0" <> res)
  defp solve("0" <> a_rest, "1" <> b_rest, 0, res), do: solve(a_rest, b_rest, 0, "1" <> res)
  defp solve("1" <> a_rest, "0" <> b_rest, 1, res), do: solve(a_rest, b_rest, 1, "0" <> res)
  defp solve("1" <> a_rest, "0" <> b_rest, 0, res), do: solve(a_rest, b_rest, 0, "1" <> res)
end
