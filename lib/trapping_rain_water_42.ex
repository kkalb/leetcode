defmodule TrappingRainWater42 do
  @moduledoc """

  https://leetcode.com/problems/trapping-rain-water/description/?envType=study-plan-v2&envId=top-interview-150

  Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

  Example 1:

  Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
  Output: 6
  Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.

  "                     █            "
  "         █           █  █     █   "
  "   █     █  █     █  █  █  █  █  █"

  "                     █            "
  "         █  ~  ~  ~  █  █  ~  █   "
  "   █  ~  █  █  ~  █  █  █  █  █  █"

  Example 2:

  Input: height = [4,2,0,3,2,5]
  Output: 9

  "               █"
  "█              █"
  "█        █     █"
  "█  █     █  █  █"
  "█  █     █  █  █"

  "               █"
  "█  ~  ~  ~  ~  █"
  "█  ~  ~  █  ~  █"
  "█  █  ~  █  █  █"
  "█  █  ~  █  █  █"


  Constraints:

  n == height.length
  1 <= n <= 2 * 104
  0 <= height[i] <= 105
  """

  @spec trap(heights :: [integer]) :: integer
  def trap([_]), do: 0

  def trap(heights) do
    #
    # 3                      x
    # 2          x           x  x     x
    # 1    x     x  x     x  x  x  x  x  x
    #   1  2  3  4  5  6  7  8  9 10 11 12

    # [0, 0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3]
    # at every position, we need to know what the height to the left is
    left_max_height = heights |> calc_left_height(0, []) |> Enum.reverse()

    # [0, 1, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3]
    # at every position, we need to know what the height to the right is
    # thats why we need to reverse it at front, to efficiently iterate in reverse order
    right_max_height = heights |> Enum.reverse() |> calc_left_height(0, [])

    # [0, 0, 1, 1, 2, 2, 2, 2, 2, 2, 1, 0]
    # for every position, we calculate the min of both max heights
    min_at_i = min_at_i(left_max_height, right_max_height, [])

    # when we know, for every position, what the left and right height is, we can calculate
    # if there fits water in it
    accumulate_water(heights, min_at_i, 0)
  end

  defp accumulate_water([], [], water), do: water

  defp accumulate_water([curr_h | rest_height], [curr_min | rest_min_at_i], water) do
    water_diff = curr_min - curr_h

    new_water =
      if water_diff > 0 do
        water + water_diff
      else
        water
      end

    accumulate_water(rest_height, rest_min_at_i, new_water)
  end

  defp min_at_i([], [], res), do: res |> Enum.reverse()

  defp min_at_i([left | max_left], [right | max_right], res) do
    min_at_i(max_left, max_right, [min(left, right) | res])
  end

  defp calc_left_height([], _curr_max, res), do: res

  defp calc_left_height([next | rest], curr_max, res) do
    new_max = max(curr_max, next)
    calc_left_height(rest, new_max, [curr_max | res])
  end
end
