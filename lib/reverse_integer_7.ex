defmodule ReverseInteger7 do
  @moduledoc """

  https://leetcode.com/problems/reverse-integer/

  Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

  Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

  Example 1:

  Input: x = 123
  Output: 321
  Example 2:

  Input: x = -123
  Output: -321
  Example 3:

  Input: x = 120
  Output: 21


  Constraints:

  -231 <= x <= 231 - 1
  """

  @max 2_147_483_647
  @min -2_147_483_648
  @spec reverse(x :: integer) :: integer
  def reverse(x), do: x |> reverse_int() |> check_bounds()
  def reverse_int(0), do: 0
  def reverse_int(x) when x < 0, do: reverse_int(x * -1) |> Kernel.*(-1)
  def reverse_int(x), do: x |> Integer.digits() |> list_to_int()
  defp check_bounds(int) when int < @min or int > @max, do: 0
  defp check_bounds(int), do: int

  defp list_to_int(list, idx \\ 0, result \\ 0)
  defp list_to_int([], _idx, result), do: result

  defp list_to_int([dig], idx, result),
    do: result + dig * Integer.pow(10, idx)

  defp list_to_int([dig | rest], idx, result),
    do: list_to_int(rest, idx + 1, result + dig * Integer.pow(10, idx))
end
