defmodule TwoSumTest do
  @moduledoc """
  Tests for isomorphic strings.
  """
  use ExUnit.Case
  alias TwoSum

  test "Case 1" do
    nums = [2, 7, 11, 15]
    target = 9

    result = TwoSum.two_sum(nums, target)
    expected = [0, 1]
    assert result == expected or Enum.reverse(expected)
  end

  test "Case 2" do
    nums = [3, 2, 4]
    target = 6

    result = TwoSum.two_sum(nums, target)
    expected = [1, 2]
    assert result == expected or Enum.reverse(expected)
  end

  test "Case 3" do
    nums = [3, 3]
    target = 6

    result = TwoSum.two_sum(nums, target)
    expected = [0, 1]
    assert result == expected or Enum.reverse(expected)
  end

  test "Case [0, ..., 10000]" do
    nums = 0..10_000 |> Enum.to_list()
    target = 19_999

    result = TwoSum.two_sum(nums, target)
    expected = [9999, 10_000]
    assert result == expected or Enum.reverse(expected)
  end
end
