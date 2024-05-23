defmodule SingleNumberTwo137 do
  @moduledoc """

  https://leetcode.com/problems/single-number-ii/description/?envType=study-plan-v2&envId=top-interview-150

  Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it.

  You must implement a solution with a linear runtime complexity and use only constant extra space.


  Example 1:

  Input: nums = [2,2,3,2]
  Output: 3
  Example 2:

  Input: nums = [0,1,0,1,0,1,99]
  Output: 99


  Constraints:

  1 <= nums.length <= 3 * 104
  -231 <= nums[i] <= 231 - 1
  Each element in nums appears exactly three times except for one element which appears once.
  """

  @spec single_number(nums :: [integer]) :: integer
  def single_number(nums) do
    nums
    |> Enum.frequencies()
    |> Enum.to_list()
    |> find_single_number()
  end

  defp find_single_number([{k, 1} | _]), do: k
  defp find_single_number([_ | rest]), do: find_single_number(rest)
end
