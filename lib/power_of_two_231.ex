defmodule PowerOfTwo231 do
  @moduledoc """

  https://leetcode.com/problems/power-of-two/

  Given an integer n, return true if it is a power of two. Otherwise, return false.

  An integer n is a power of two, if there exists an integer x such that n == 2x.

  Example 1:

  Input: n = 1
  Output: true
  Explanation: 20 = 1
  Example 2:

  Input: n = 16
  Output: true
  Explanation: 24 = 16
  Example 3:

  Input: n = 3
  Output: false


  Constraints:

  -231 <= n <= 231 - 1
  """

  @spec is_power_of_two(n :: integer) :: boolean
  def is_power_of_two(n) do
    cond do
      n == 0 ->
        false

      n < 0 ->
        false

      true ->
        log2 = :math.log2(n)
        Float.floor(log2) == log2
    end
  end
end
