defmodule TwoSumII167 do
  @moduledoc """

  https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/?envType=study-plan-v2&envId=top-interview-150

  Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.

  Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.

  The tests are generated such that there is exactly one solution. You may not use the same element twice.

  Your solution must use only constant extra space.

  Example 1:

  Input: numbers = [2,7,11,15], target = 9
  Output: [1,2]
  Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
  Example 2:

  Input: numbers = [2,3,4], target = 6
  Output: [1,3]
  Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].
  Example 3:

  Input: numbers = [-1,0], target = -1
  Output: [1,2]
  Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].


  Constraints:

  2 <= numbers.length <= 3 * 104
  -1000 <= numbers[i] <= 1000
  numbers is sorted in non-decreasing order.
  -1000 <= target <= 1000
  The tests are generated such that there is exactly one solution.
  """

  @spec two_sum(numbers :: [integer], target :: integer) :: [integer]
  def two_sum(numbers, target) do
    numbers
    |> Enum.with_index(1)
    |> ensure_only_two_appearences()
    |> brute_force(target)
  end

  defp brute_force(numbers, target) do
    Enum.reduce_while(numbers, [], fn {num, idx}, _acc ->
      case Enum.find(numbers, fn {v, i} -> target - v == num and i != idx end) do
        nil -> {:cont, []}
        {_v, i} -> {:halt, [idx, i]}
      end
    end)
  end

  # decreasing the complexity from O(n^2) to O(log n^2)
  defp ensure_only_two_appearences(numbers) do
    [{num1, idx1}, {num2, idx2} | rest] = numbers

    Enum.reduce(rest, [{num1, idx1}, {num2, idx2}], fn {num, idx},
                                                       [
                                                         {last_num, _last_idx},
                                                         {second_last_num, _second_last_idx} | _
                                                       ] = acc ->
      if second_last_num == last_num and last_num == num do
        acc
      else
        acc ++ [{num, idx}]
      end
    end)
  end
end
