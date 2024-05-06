defmodule MinimumSizeSubarraySum209 do
  @moduledoc """

  https://leetcode.com/problems/minimum-size-subarray-sum/description/

  Given an array of positive integers nums and a positive integer target, return the minimal length of a
  subarray
  whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.



  Example 1:

  Input: target = 7, nums = [2,3,1,2,4,3]
  Output: 2
  Explanation: The subarray [4,3] has the minimal length under the problem constraint.
  Example 2:

  Input: target = 4, nums = [1,4,4]
  Output: 1
  Example 3:

  Input: target = 11, nums = [1,1,1,1,1,1,1,1]
  Output: 0


  Constraints:

  1 <= target <= 109
  1 <= nums.length <= 105
  1 <= nums[i] <= 104


  Follow up: If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log(n)).
  """

  @spec min_sub_array_len(target :: integer, nums :: [integer]) :: integer
  def min_sub_array_len(target, nums) do
    size = Enum.count(nums) - 1

    ret =
      nums
      |> Enum.with_index()
      |> Map.new(fn {v, i} -> {i, v} end)
      |> sliding_window(size, 0, 0, nil, target)
      |> elem(1)

    if is_nil(ret), do: 0, else: ret
  end

  defp sliding_window(nums, size, sum, left, ans, target) do
    Enum.reduce(0..size, {sum, ans, left}, fn i, {sum, ans, left} ->
      sum = sum + nums[i]
      while(sum, target, i, ans, left, nums)
    end)
  end

  defp while(sum, target, i, ans, left, nums) when sum >= target do
    ans = flex_min(ans, i + 1 - left)
    sum = sum - nums[left]
    while(sum, target, i, ans, left + 1, nums)
  end

  defp while(sum, _target, _i, ans, left, _nums) do
    {sum, ans, left}
  end

  defp flex_min(nil, idx), do: idx
  defp flex_min(ans, idx), do: min(ans, idx)
end
