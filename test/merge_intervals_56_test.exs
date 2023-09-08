defmodule MergeIntervals56Test do
  @moduledoc false
  use ExUnit.Case
  import MergeIntervals56

  test "Case 1" do
    intervals = [[1, 3], [2, 6], [8, 10], [15, 18]]
    expected = [[1, 6], [8, 10], [15, 18]]

    result = merge(intervals)
    assert result == expected
  end

  test "Case 2" do
    intervals = [[1, 4], [4, 5]]
    expected = [[1, 5]]

    result = merge(intervals)
    assert result == expected
  end

  test "Case 3" do
    intervals = [[1, 4], [0, 4]]
    expected = [[0, 4]]

    result = merge(intervals)
    assert result == expected
  end

  test "Case 4" do
    intervals = [[1, 4], [0, 0]]
    expected = [[0, 0], [1, 4]]

    result = merge(intervals)
    assert result == expected
  end

  test "Case 5" do
    intervals = [[2, 3], [4, 5], [6, 7], [8, 9], [1, 10]]
    expected = [[1, 10]]

    result = merge(intervals)
    assert result == expected
  end

  test "Case 6" do
    intervals = [[2, 3], [5, 5], [2, 2], [3, 4], [3, 4]]
    expected = [[2, 4], [5, 5]]

    result = merge(intervals)
    assert result == expected
  end
end
