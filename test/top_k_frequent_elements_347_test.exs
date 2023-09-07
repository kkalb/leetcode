defmodule TopKFrequentElements347Test do
  @moduledoc false
  use ExUnit.Case
  alias TopKFrequentElements347

  test "Case 1" do
    nums = [1, 1, 1, 2, 2, 3]
    k = 2

    result = TopKFrequentElements347.top_k_frequent(nums, k)
    expected = [1, 2]
    assert result == expected
  end

  test "Case 2" do
    nums = [1]
    k = 1

    result = TopKFrequentElements347.top_k_frequent(nums, k)
    expected = [1]
    assert result == expected
  end

  test "Case 3" do
    nums = [-1, -1]
    k = 1

    result = TopKFrequentElements347.top_k_frequent(nums, k)
    expected = [-1]
    assert result == expected
  end
end
