defmodule FindFirstLastPos34 do
  @moduledoc """

  https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/

  Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

  If target is not found in the array, return [-1, -1].

  You must write an algorithm with O(log n) runtime complexity.


  Example 1:

  Input: nums = [5,7,7,8,8,10], target = 8
  Output: [3,4]
  Example 2:

  Input: nums = [5,7,7,8,8,10], target = 6
  Output: [-1,-1]
  Example 3:

  Input: nums = [], target = 0
  Output: [-1,-1]


  Constraints:

  0 <= nums.length <= 10^5
  -10^9 <= nums[i] <= 10^9
  nums is a non-decreasing array.
  -10^9 <= target <= 10^9
  """

  @spec search_range(nums :: [integer], target :: integer) :: [integer]
  def search_range(nums, target) do
    solve(nums, target, -1, -1, 0)
  end

  defp solve([num | []], target, -1, -1, _idx) when num > target do
    [-1, -1]
  end

  defp solve([num | []], target, -1, -1, _idx) when num < target do
    [-1, -1]
  end

  defp solve([num | nums], target, -1, -1, idx) when num == target do
    solve(nums, target, idx, idx, idx + 1)
  end

  defp solve([num | nums], target, lp, _rp, idx) when num == target do
    solve(nums, target, lp, idx, idx + 1)
  end

  defp solve([num | nums], target, lp, rp, idx) when num < target do
    solve(nums, target, lp, rp, idx + 1)
  end

  defp solve(_nums, _target, lp, rp, _idx) do
    [lp, rp]
  end
end
