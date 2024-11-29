defmodule CombinationSum39Test do
  use ExUnit.Case
  alias CombinationSum39

  test "Case 1" do
    candidates = [2, 3, 6, 7]
    target = 7

    assert CombinationSum39.combination_sum(candidates, target) == [[2, 2, 3], [7]]
  end

  test "Case 2" do
    candidates = [2, 3, 5]
    target = 8

    assert CombinationSum39.combination_sum(candidates, target) == [
             [2, 2, 2, 2],
             [2, 3, 3],
             [3, 5]
           ]
  end

  test "Case 3" do
    candidates = [2]
    target = 1

    assert CombinationSum39.combination_sum(candidates, target) == []
  end
end
