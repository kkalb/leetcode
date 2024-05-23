defmodule BestTimeToBuyAndSellStock121 do
  @moduledoc """

  https://leetcode.com/problems/best-time-to-buy-and-sell-stock/?envType=study-plan-v2&envId=top-interview-150

  You are given an array prices where prices[i] is the price of a given stock on the ith day.

  You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

  Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.



  Example 1:

  Input: prices = [7,1,5,3,6,4]
  Output: 5
  Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
  Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
  Example 2:

  Input: prices = [7,6,4,3,1]
  Output: 0
  Explanation: In this case, no transactions are done and the max profit = 0.


  Constraints:

  1 <= prices.length <= 10^5
  0 <= prices[i] <= 10^4
  """

  @spec max_profit(prices :: [integer]) :: integer
  def max_profit([_single_price]) do
    0
  end

  def max_profit(prices) do
    get_profit(prices, 0)
  end

  defp get_profit([], result) do
    result
  end

  defp get_profit([price_at_day | prices], acc) do
    max =
      Enum.reduce(prices, 0, fn future_price, res ->
        win = future_price - price_at_day
        if win > res, do: win, else: res
      end)

    get_profit(prices, if(max > acc, do: max, else: acc))
  end
end
