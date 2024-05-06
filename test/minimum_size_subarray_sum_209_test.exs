defmodule MinimumSizeSubarraySum209Test do
  use ExUnit.Case
  alias MinimumSizeSubarraySum209

  test "Case 1" do
    nums = [2, 3, 1, 2, 4, 3]
    target = 7

    assert MinimumSizeSubarraySum209.min_sub_array_len(target, nums) == 2
  end

  test "Case 2" do
    nums = [1, 4, 4]
    target = 4

    assert MinimumSizeSubarraySum209.min_sub_array_len(target, nums) == 1
  end

  test "Case 3" do
    nums = [1, 1, 1, 1, 1, 1, 1, 1]
    target = 11

    assert MinimumSizeSubarraySum209.min_sub_array_len(target, nums) == 0
  end
end
