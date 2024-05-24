defmodule JumpGame55 do
  @moduledoc """

  https://leetcode.com/problems/jump-game/?envType=study-plan-v2&envId=top-interview-150

  You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

  Return true if you can reach the last index, or false otherwise.


  Example 1:

  Input: nums = [2,3,1,1,4]
  Output: true
  Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
  Example 2:

  Input: nums = [3,2,1,0,4]
  Output: false
  Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.


  Constraints:

  1 <= nums.length <= 104
  0 <= nums[i] <= 105
  """

  @spec can_jump(nums :: [integer]) :: boolean
  # no matter what the single element is, we already reached the end, ggez
  def can_jump([_num]), do: true

  # when first element is 0 and this is not already the end, we can never win and surrender early
  def can_jump([0 | _nums]), do: false

  def can_jump([num | _nums] = nums) do
    {lookup, goal} = lookup_and_size(nums, %{}, 0)
    stack = push([], {num, 0})
    check(stack, lookup, goal)
  end

  # when stack is empty, we can not reach a position where we not get stuck, so we surrender
  defp check([], _lookup, _goal), do: false

  defp check(stack, lookup, goal) do
    {remaining_width, last_idx} = fetch(stack)

    max_width = last_idx + remaining_width

    if landing = lookup[max_width] do
      # if there is a landing, we did not jump too far so we go on

      cond do
        max_width == goal ->
          # if we can jump to the end, we finished the game
          true

        # we know from the current position that the landing is already exhausted or was 0 from the beginnin
        landing == 0 ->
          stack |> reduce_top_num |> check(lookup, goal)

        remaining_width >= 1 ->
          # we jump to this element by putting it on the stack when the landing point can be
          # used to jump again
          stack |> reduce_top_num |> push({landing, max_width}) |> check(lookup, goal)

        # remaining_width is exhausted, we discard the top element of the stack
        remaining_width < 1 ->
          {stack, {_, position}} = pop(stack)
          stack |> check(mark_bad_position_for_future(lookup, position), goal)

        true ->
          stack |> reduce_top_num() |> check(lookup, goal)
      end
    else
      # when we jump too far, we basically won because we can just jump less we save computing time :)
      true
    end
  end

  defp mark_bad_position_for_future(lookup, idx), do: Map.update!(lookup, idx, fn _ -> 0 end)

  defp pop([ele | rest]), do: {rest, ele}
  defp push(elements, ele), do: [ele | elements]
  defp fetch([ele | _rest_stack]), do: ele
  defp reduce_top_num([{num, idx} | elements]), do: push(elements, {num - 1, idx})

  defp lookup_and_size([num], lookup, size) do
    {Map.put(lookup, size, num), size}
  end

  defp lookup_and_size([num | nums], lookup, size) do
    lookup_and_size(nums, Map.put(lookup, size, num), size + 1)
  end
end
