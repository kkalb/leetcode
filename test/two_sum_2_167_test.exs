defmodule TwoSumII167Test do
  use ExUnit.Case
  alias TwoSumII167

  test "Case 1" do
    numbers = [2, 7, 11, 15]
    target = 9

    assert TwoSumII167.two_sum(numbers, target) == [1, 2]
  end

  test "Case 2" do
    numbers = [2, 3, 4]
    target = 6

    assert TwoSumII167.two_sum(numbers, target) == [1, 3]
  end

  test "Case 3" do
    numbers = [-1, 0]
    target = -1

    assert TwoSumII167.two_sum(numbers, target) == [1, 2]
  end

  test "Case 4" do
    numbers = [0, 0, 3, 4]
    target = 0

    assert TwoSumII167.two_sum(numbers, target) == [1, 2]
  end

  test "Case 5" do
    numbers = for(_ <- 1..10000, do: 0) ++ [2, 3, 9, 9, 9, 9]

    target = 5

    assert TwoSumII167.two_sum(numbers, target) == [10001, 10002]
  end
end
