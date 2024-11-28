defmodule SearchInsertPosition35 do
  @moduledoc """

  https://leetcode.com/problems/search-insert-position/

  Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

  You must write an algorithm with O(log n) runtime complexity.

  Example 1:

  Input: nums = [1,3,5,6], target = 5
  Output: 2
  Example 2:

  Input: nums = [1,3,5,6], target = 2
  Output: 1
  Example 3:

  Input: nums = [1,3,5,6], target = 7
  Output: 4

  Constraints:

  1 <= nums.length <= 10^4
  -10^4 <= nums[i] <= 10^4
  nums contains distinct values sorted in ascending order.
  -10^4 <= target <= 10^4
  """

  @spec search_insert(nums :: [integer], target :: integer) :: integer
  def search_insert(nums, target) do
    solve(nums, target, 0)
  end

  defp solve([], _target, idx) do
    idx
  end

  defp solve([num | _nums], target, idx) when num >= target do
    idx
  end

  defp solve([_num | nums], target, idx) do
    solve(nums, target, idx + 1)
  end
end
