defmodule SummaryRanges228Test do
  @moduledoc """
  Tests for isomorphic strings.
  """
  use ExUnit.Case
  import SummaryRanges228

  test "Case 1" do
    nums = [0, 1, 2, 4, 5, 7]

    result = summary_ranges(nums)

    assert result == ["0->2", "4->5", "7"]
  end

  test "Case 2" do
    nums = [0, 2, 3, 4, 6, 8, 9]

    result = summary_ranges(nums)

    assert result == ["0", "2->4", "6", "8->9"]
  end

  test "Case 3" do
    nums = [2, -1]

    result = summary_ranges(nums)

    assert result == ["2", "-1"]
  end
end
