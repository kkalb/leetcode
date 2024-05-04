defmodule MajorityElement169 do
  @moduledoc """

  https://leetcode.com/problems/majority-element/description/?envType=study-plan-v2&envId=top-interview-150

  Given an array nums of size n, return the majority element.

  The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

  Example 1:

  Input: nums = [3,2,3]
  Output: 3
  Example 2:

  Input: nums = [2,2,1,1,1,2,2]
  Output: 2


  Constraints:

  n == nums.length
  1 <= n <= 5 * 104
  -109 <= nums[i] <= 109


  Follow-up: Could you solve the problem in linear time and in O(1) space?
  """

  @spec majority_element(nums :: [integer]) :: integer

  # since we have the majority element appearing more than half of the time, we can apply Moore_majority_vote_algorithm
  # https://en.wikipedia.org/wiki/Boyer%E2%80%93Moore_majority_vote_algorithm

  def majority_element([head | tail]), do: recur(tail, 1, head)

  defp recur([head | tail], 0, _candidate), do: recur(tail, 1, head)

  defp recur([last], _count, candidate) when last === candidate, do: candidate

  defp recur([head | tail], count, candidate) when head === candidate,
    do: recur(tail, count + 1, candidate)

  defp recur([_head | tail], count, candidate), do: recur(tail, count - 1, candidate)

  defp recur([], _count, candidate), do: candidate

  # this should also work when majority elements appears less than half of the time
  # def majority_element(nums) do
  #   Enum.reduce(nums, %{majority_num: 0}, fn current_num, acc ->
  #     acc = Map.update(acc, current_num, 1, &(&1 + 1))
  #     majority_num = acc.majority_num

  #     amount_added_num = Map.get(acc, current_num)
  #     key_majority_num = Map.get(acc, :majority_num)
  #     amount_majority_num = Map.get(acc, key_majority_num, 0)

  #     if majority_num == current_num do
  #       acc
  #     else
  #       if amount_added_num >= amount_majority_num do
  #         Map.put(acc, :majority_num, current_num)
  #       else
  #         acc
  #       end
  #     end
  #   end).majority_num
  # end
end
