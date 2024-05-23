defmodule BestTimeToBuyAndSellStock121Test do
  use ExUnit.Case
  alias BestTimeToBuyAndSellStock121

  test "Case 1" do
    prices = [7, 1, 5, 3, 6, 4]
    expected = 5

    assert BestTimeToBuyAndSellStock121.max_profit(prices) == expected
  end

  test "Case 2" do
    prices = [7, 6, 4, 3, 1]
    expected = 0

    assert BestTimeToBuyAndSellStock121.max_profit(prices) == expected
  end

  test "Case 3" do
    prices = [1]
    expected = 0

    assert BestTimeToBuyAndSellStock121.max_profit(prices) == expected
  end

  test "Case 4" do
    l = Enum.to_list(10_000..0)

    prices = Enum.concat(l, Enum.reverse(l))
    expected = 10_000

    assert BestTimeToBuyAndSellStock121.max_profit(prices) == expected
  end
end
