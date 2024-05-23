defmodule SingleNumberTwo137Test do
  use ExUnit.Case
  alias SingleNumberTwo137

  test "Case 1" do
    nums = [2, 2, 3, 2]
    output = 3

    assert SingleNumberTwo137.single_number(nums) == output
  end

  test "Case 2" do
    nums = [0, 1, 0, 1, 0, 1, 99]
    output = 99

    assert SingleNumberTwo137.single_number(nums) == output
  end
end
