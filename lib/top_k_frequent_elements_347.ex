defmodule TopKFrequentElements347 do
  @moduledoc """

  https://leetcode.com/problems/top-k-frequent-elements/

  Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

  Example 1:

  Input: nums = [1,1,1,2,2,3], k = 2
  Output: [1,2]
  Example 2:

  Input: nums = [1], k = 1
  Output: [1]


  Constraints:

  1 <= nums.length <= 105
  -104 <= nums[i] <= 104
  k is in the range [1, the number of unique elements in the array].
  It is guaranteed that the answer is unique.
  """

  @spec top_k_frequent(nums :: [integer], k :: integer) :: [integer]
  def top_k_frequent(nums, k) do
    nums
    |> Enum.frequencies()
    |> Enum.map(fn {key, val} -> {val, key} end)
    |> Enum.sort_by(fn {key, _val} -> key end, :desc)
    |> Enum.take(k)
    |> Enum.map(fn {_key, val} -> val end)
    |> Enum.sort()
  end
end
