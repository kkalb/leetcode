defmodule FindFirstLastPos34Test do
  use ExUnit.Case
  alias FindFirstLastPos34

  test "Case 1" do
    nums = [5, 7, 7, 8, 8, 10]
    target = 8

    assert FindFirstLastPos34.search_range(nums, target) == [3, 4]
  end

  test "Case 2" do
    nums = [5, 7, 7, 8, 8, 10]
    target = 6

    assert FindFirstLastPos34.search_range(nums, target) == [-1, -1]
  end

  test "Case 3" do
    nums = []
    target = 0

    assert FindFirstLastPos34.search_range(nums, target) == [-1, -1]
  end

  test "Case 4" do
    nums = [1]
    target = 1

    assert FindFirstLastPos34.search_range(nums, target) == [0, 0]
  end

  test "Case 5" do
    nums = [1, 3]
    target = 1

    assert FindFirstLastPos34.search_range(nums, target) == [0, 0]
  end

  test "Case 6" do
    nums = [1]
    target = 0

    assert FindFirstLastPos34.search_range(nums, target) == [-1, -1]
  end

  test "Case 7" do
    nums = [2, 2]
    target = 3

    assert FindFirstLastPos34.search_range(nums, target) == [-1, -1]
  end

  test "Case 8" do
    nums = [1, 4]
    target = 4

    assert FindFirstLastPos34.search_range(nums, target) == [1, 1]
  end
end
