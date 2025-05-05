defmodule FactorialTrailingZeros172Test do
  use ExUnit.Case
  alias FactorialTrailingZeros172

  test "Case 1" do
    n = 3
    res = 0

    assert FactorialTrailingZeros172.trailing_zeroes(n) == res
  end

  test "Case 2" do
    n = 5
    res = 1

    assert FactorialTrailingZeros172.trailing_zeroes(n) == res
  end

  test "Case 3" do
    n = 0
    res = 0

    assert FactorialTrailingZeros172.trailing_zeroes(n) == res
  end

  test "Case time limit" do
    n = 5138
    res = 1282

    assert FactorialTrailingZeros172.trailing_zeroes(n) == res
  end
end
