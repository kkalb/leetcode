defmodule MajorityElement169Test do
  use ExUnit.Case
  alias MajorityElement169

  test "Case 1" do
    nums = [3, 2, 3]
    result = 3

    assert MajorityElement169.majority_element(nums) == result
  end

  test "Case 2" do
    nums = [2, 2, 1, 1, 1, 2, 2]
    result = 2

    assert MajorityElement169.majority_element(nums) == result
  end

  test "Case 3" do
    nums = [3, 3, 4]
    result = 3

    assert MajorityElement169.majority_element(nums) == result
  end

  test "Case 4" do
    nums = [6, 5, 5]
    result = 5

    assert MajorityElement169.majority_element(nums) == result
  end
end
