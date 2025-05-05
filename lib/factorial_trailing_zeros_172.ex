defmodule FactorialTrailingZeros172 do
  @moduledoc """

  https://leetcode.com/problems/factorial-trailing-zeroes/?envType=study-plan-v2&envId=top-interview-150

  Given an integer n, return the number of trailing zeroes in n!.

  Note that n! = n * (n - 1) * (n - 2) * ... * 3 * 2 * 1.

  Example 1:

  Input: n = 3
  Output: 0
  Explanation: 3! = 6, no trailing zero.
  Example 2:

  Input: n = 5
  Output: 1
  Explanation: 5! = 120, one trailing zero.
  Example 3:

  Input: n = 0
  Output: 0


  Constraints:

  0 <= n <= 104


  Follow up: Could you write a solution that works in logarithmic time complexity?
  """
  @spec trailing_zeroes(n :: integer) :: integer
  def trailing_zeroes(0), do: 0
  def trailing_zeroes(n), do: fac(n, 1)

  defp fac(0, acc), do: acc

  defp fac(n, acc) do
    v = Integer.floor_div(n, 5)
    v + fac(v, v * acc)
  end
end
