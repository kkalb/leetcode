defmodule SummaryRanges228 do
  @moduledoc """

  https://leetcode.com/problems/summary-ranges/?envType=study-plan-v2&envId=top-interview-150

  You are given a sorted unique integer array nums.

  A range [a,b] is the set of all integers from a to b (inclusive).

  Return the smallest sorted list of ranges that cover all the numbers in the array exactly. That is, each element of nums is covered by exactly one of the ranges, and there is no integer x such that x is in one of the ranges but not in nums.

  Each range [a,b] in the list should be output as:

  "a->b" if a != b
  "a" if a == b


  Example 1:

  Input: nums = [0,1,2,4,5,7]
  Output: ["0->2","4->5","7"]
  Explanation: The ranges are:
  [0,2] --> "0->2"
  [4,5] --> "4->5"
  [7,7] --> "7"
  Example 2:

  Input: nums = [0,2,3,4,6,8,9]
  Output: ["0","2->4","6","8->9"]
  Explanation: The ranges are:
  [0,0] --> "0"
  [2,4] --> "2->4"
  [6,6] --> "6"
  [8,9] --> "8->9"


  Constraints:

  0 <= nums.length <= 20
  -231 <= nums[i] <= 231 - 1
  All the values of nums are unique.
  nums is sorted in ascending order.
  """

  @spec summary_ranges(nums :: [integer]) :: [String.t()]
  def summary_ranges(nums) do
    consecutive_lists(nums)
    |> Enum.map(fn sublist ->
      case sublist do
        [x] ->
          to_string(x)

        _ ->
          f = List.first(sublist)
          l = List.last(sublist)
          "#{f}->#{l}"
      end
    end)
  end

  def consecutive_lists(list) do
    list |> consecutive_lists_helper([], [])
  end

  defp consecutive_lists_helper([], [], result), do: Enum.reverse(result)

  defp consecutive_lists_helper([], current_group, result),
    do: Enum.reverse([Enum.reverse(current_group) | result])

  defp consecutive_lists_helper([current | tail], [], result) do
    consecutive_lists_helper(tail, [current], result)
  end

  defp consecutive_lists_helper([current | tail], [prev | _] = current_group, result)
       when current - prev == 1 do
    consecutive_lists_helper(tail, [current | current_group], result)
  end

  defp consecutive_lists_helper([current | tail], current_group, result) do
    consecutive_lists_helper(tail, [current], [Enum.reverse(current_group) | result])
  end
end
