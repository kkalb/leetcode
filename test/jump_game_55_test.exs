defmodule JumpGame55Test do
  use ExUnit.Case
  alias JumpGame55

  test "Case 1" do
    nums = [2, 3, 1, 1, 4]
    assert JumpGame55.can_jump(nums)
  end

  test "Case 2" do
    nums = [3, 2, 1, 0, 4]
    refute JumpGame55.can_jump(nums)
  end

  test "Case 3" do
    nums = [1]
    assert JumpGame55.can_jump(nums)
  end

  test "Case 4" do
    nums = [2, 5, 0, 0]
    assert JumpGame55.can_jump(nums)
  end

  test "Case 5" do
    nums = [0, 1]
    refute JumpGame55.can_jump(nums)
  end

  test "Case 6" do
    nums = [2, 3, 1, 0, 1, 3, 2, 5]
    assert JumpGame55.can_jump(nums)
  end

  test "Case 7" do
    nums = [2, 3, 1, 0, 1, 3, 2, 5, 2, 3, 1, 0, 1, 3, 2, 5]
    assert JumpGame55.can_jump(nums)
  end
end
