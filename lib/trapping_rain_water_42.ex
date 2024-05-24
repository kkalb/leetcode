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
  @plot false
  @air 0
  @stone 1

  @spec trap(heights :: [integer]) :: integer
  def trap([_]), do: 0

  def trap(heights) do
    max_height = Enum.max(heights)

    heights
    |> build_map(max_height)
    |> Plotting.plot_map(@plot)
    |> fill_with_water(max_height, 1, 0)
  end

  defp build_map(heights, max_height) do
    #
    # 3                      x
    # 2          x           x  x     x
    # 1    x     x  x     x  x  x  x  x  x
    #   1  2  3  4  5  6  7  8  9 10 11 12
    for i <- 1..max_height, into: %{} do
      # IO.inspect(max_height, label: "building row #{i}")
      {i, row_stone(heights, i)}
    end
  end

  defp row_stone(heights, h_to_check) do
    for {h_at_pos, h_pos} <- Enum.with_index(heights, 1), into: %{} do
      {h_pos, get_stone_or_air(h_at_pos, h_to_check)}
    end
  end

  defp get_stone_or_air(h_at_pos, h_to_check) do
    if h_at_pos >= h_to_check, do: @stone, else: @air
  end

  defp fill_with_water(_elevation_map, max_height, idx, res) when idx > max_height do
    res
  end

  defp fill_with_water(elevation_map, max_height, idx, res) do
    # IO.inspect("#{idx}/#{max_height}")
    ground = elevation_map[idx]
    ground_list = ground |> map_to_sorted_list(:asc)
    {left, _} = Enum.find(ground_list, fn {_, e} -> e == @stone end)
    {right, _} = ground_list |> Enum.reverse() |> Enum.find(fn {_, e} -> e == 1 end)
    row_water = row_water(ground, left, right, 0)
    fill_with_water(elevation_map, max_height, idx + 1, res + row_water)
  end

  defp row_water(_elevation_map, left, right, res) when left >= right do
    res
  end

  defp row_water(elevation_map, left, right, res) do
    add_water =
      if Map.get(elevation_map, left) == @air do
        1
      else
        0
      end

    row_water(elevation_map, left + 1, right, res + add_water)
  end

  # also used by plotting
  def map_to_sorted_list(elevation_map, order) do
    elevation_map |> Map.to_list() |> Enum.sort_by(fn {i, _inner} -> i end, order)
  end
end

defmodule Plotting do
  # only plotting functions below
  @air 0
  @stone 1
  @water 2

  def plot_map(elevation_map, false) do
    elevation_map
  end

  def plot_map(elevation_map, true) do
    elevation_list = TrappingRainWater42.map_to_sorted_list(elevation_map, :desc)

    _ =
      for {_i, inner_e_map} <- elevation_list do
        inner_e_list = TrappingRainWater42.map_to_sorted_list(inner_e_map, :asc)

        build_row_string(inner_e_list)
        |> IO.inspect()
      end

    IO.inspect("___________________")
    elevation_map
  end

  defp build_row_string(inner_e_list) do
    inner_e_list |> Enum.map(fn {_, e} -> fill(e) end) |> Enum.join("  ")
  end

  defp fill(@air), do: " "
  defp fill(@stone), do: "\u2588"
  defp fill(@water), do: "~"
end
