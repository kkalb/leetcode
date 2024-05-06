defmodule SingleNumber136Test do
  use ExUnit.Case
  alias SingleNumber136

  test "Case 1" do
    nums = [2, 2, 1]

    assert SingleNumber136.single_number(nums) == 1
  end

  test "Case 2" do
    nums = [4, 1, 2, 1, 2]

    assert SingleNumber136.single_number(nums) == 4
  end

  test "Case 3" do
    nums = [1]

    assert SingleNumber136.single_number(nums) == 1
  end
end
