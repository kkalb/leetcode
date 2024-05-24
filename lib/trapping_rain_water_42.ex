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

  # @plot false
  # @stone 0

  @spec trap(heights :: [integer]) :: integer
  def trap([_]), do: 0

  def trap(heights) do
    max_height = Enum.max(heights)
    length = length(heights)
    build_map(heights, max_height, length)
  end

  defp build_map(heights, max_height, length) do
    #
    # 3                      x
    # 2          x           x  x     x
    # 1    x     x  x     x  x  x  x  x  x
    #   1  2  3  4  5  6  7  8  9 10 11 12
    heights_i = Enum.with_index(heights, 1)
    heights_i_reversed = Enum.reverse(heights_i)

    row_by_row(heights_i, heights_i_reversed, 1, max_height, length, 0)
  end

  defp row_by_row(l, r, _, _, _, water) when l == [] or r == [] do
    water
  end

  defp row_by_row(
         [{left_h, left_i} | left_rest] = l,
         [{right_h, right_i} | right_rest] = r,
         water_idx,
         max_height,
         length,
         water
       ) do
    # IO.inspect(water_idx, label: "current row")

    cond do
      left_i == right_i ->
        water

      left_h < water_idx and right_h < water_idx ->
        # IO.puts("Shifting both")
        row_by_row(left_rest, right_rest, water_idx, max_height, length, water)

      left_h < water_idx ->
        # IO.puts("Increasing left")
        row_by_row(left_rest, r, water_idx, max_height, length, water)

      right_h < water_idx ->
        # IO.puts("Decreasing right")
        row_by_row(l, right_rest, water_idx, max_height, length, water)

      true ->
        # start_time = System.monotonic_time(:nanosecond)
        row_water = calc_water_in_row(left_rest, left_i + 1, right_i, water_idx, 0)
        # measure(start_time)

        # IO.inspect(row_water,
        #   label: "row completed with water between #{left_i} and #{right_i}"
        # )

        row_by_row(l, r, water_idx + 1, max_height, length, water + row_water)
    end
  end

  defp calc_water_in_row(_, l_i, r_i, _water_level, water) when l_i == r_i do
    water
  end

  defp calc_water_in_row([{curr_h, _} | rest], l_i, r_i, water_level, water) do
    diff = water_level - curr_h

    add_water =
      if diff > 0 do
        # IO.inspect("#{water_level} - #{curr_h} (#{l_i})", label: "Increasing water by 1")
        1
      else
        0
      end

    calc_water_in_row(rest, l_i + 1, r_i, water_level, water + add_water)
  end

  def measure(start_time) do
    end_time = System.monotonic_time(:nanosecond)
    diff = end_time - start_time

    print =
      cond do
        diff >= 1_000_000_000 -> to_string(diff / 1_000_000_000) <> " s"
        diff >= 1_000_000 -> to_string(diff / 1_000_000) <> " ms"
        diff >= 1_000 -> to_string(diff / 1_000) <> " µs"
        true -> to_string(diff) <> " ns"
      end

    IO.inspect(print)
  end

  # defp row_stone(heights_i, h_to_check) do
  #   for {h_at_pos, h_pos} <- heights_i, h_at_pos >= h_to_check, into: %{} do
  #     {h_pos, @stone}
  #   end
  # end

  # defp fill_with_water(_elevation_map, max_height, idx, res) when idx > max_height do
  #   res
  # end

  # defp fill_with_water(elevation_map, max_height, idx, res) do
  #   if rem(idx, 1000) == 0, do: IO.inspect("#{idx}/#{max_height}")
  #   ground = elevation_map[idx]
  #   ground_list = ground |> map_to_sorted_list(:asc)
  #   {left, _} = Enum.find(ground_list, fn {_, e} -> e == @stone end)
  #   {right, _} = ground_list |> Enum.reverse() |> Enum.find(fn {_, e} -> e == @stone end)
  #   row_water = row_water(ground, left, right, 0)
  #   fill_with_water(elevation_map, max_height, idx + 1, res + row_water)
  # end

  # defp row_water(_elevation_map, left, right, res) when left >= right do
  #   res
  # end

  # defp row_water(elevation_map, left, right, res) do
  #   # if there is stone, we use 0, if it is nil, we use 1
  #   add_water = Map.get(elevation_map, left, 1)

  #   row_water(elevation_map, left + 1, right, res + add_water)
  # end

  # # also used by plotting
  # def map_to_sorted_list(elevation_map, order) do
  #   elevation_map |> Map.to_list() |> Enum.sort_by(fn {i, _inner} -> i end, order)
  # end
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
    elevation_list = map_to_sorted_list(elevation_map, :desc)

    _ =
      for {_i, inner_e_map} <- elevation_list do
        inner_e_list = map_to_sorted_list(inner_e_map, :asc)

        build_row_string(inner_e_list)
        |> IO.inspect()
      end

    IO.inspect("___________________")
    elevation_map
  end

  # # also used by plotting
  def map_to_sorted_list(elevation_map, order) do
    elevation_map |> Map.to_list() |> Enum.sort_by(fn {i, _inner} -> i end, order)
  end

  defp build_row_string(inner_e_list) do
    inner_e_list |> Enum.map(fn {_, e} -> fill(e) end) |> Enum.join("  ")
  end

  defp fill(@air), do: " "
  defp fill(@stone), do: "\u2588"
  defp fill(@water), do: "~"
end
