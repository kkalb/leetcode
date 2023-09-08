defmodule MergeIntervals56 do
  @moduledoc """

  https://leetcode.com/problems/merge-intervals/?envType=study-plan-v2&envId=top-interview-150

  Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

  Example 1:

  Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
  Output: [[1,6],[8,10],[15,18]]
  Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
  Example 2:

  Input: intervals = [[1,4],[4,5]]
  Output: [[1,5]]
  Explanation: Intervals [1,4] and [4,5] are considered overlapping.


  Constraints:

  1 <= intervals.length <= 104
  intervals[i].length == 2
  0 <= starti <= endi <= 104
  """

  @spec merge(intervals :: [[integer]]) :: [[integer]]
  def merge(intervals) do
    intervals
    |> Enum.sort_by(fn [min | _] -> min end)
    |> Enum.map(fn interval -> Enum.min(interval)..Enum.max(interval) end)
    |> reduce()
    |> ranges_to_lists()
  end

  defp ranges_to_lists(interval_ranges) do
    interval_ranges
    |> Enum.map(fn r ->
      calc_min_max_for_range(r)
    end)
  end

  defp calc_min_max_for_range(min..max) when min === max do
    [min, min]
  end

  defp calc_min_max_for_range(min..max) do
    [min, max]
  end

  defp reduce(interval_ranges) do
    interval_ranges
    |> Enum.reduce([], fn interval, acc ->
      case acc do
        [] ->
          [interval]

        _ ->
          previous_interval = List.last(acc)

          if Range.disjoint?(previous_interval, interval) do
            List.insert_at(acc, -1, interval)
          else
            range = find_min_max(previous_interval, interval)

            List.replace_at(acc, -1, range)
          end
      end
    end)
  end

  defp find_min_max(previous_interval, interval) do
    previous_max = Enum.max(previous_interval)
    previous_min = Enum.min(previous_interval)
    current_min = Enum.min(interval)
    current_max = Enum.max(interval)

    new_min = Enum.min([current_min, previous_min])
    new_max = Enum.max([previous_max, current_max])

    new_min..new_max
  end
end
