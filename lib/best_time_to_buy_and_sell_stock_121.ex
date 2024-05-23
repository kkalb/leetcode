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
  def max_profit([_price]), do: 0
  def max_profit([price | prices]), do: calc_profit(prices, 0, price)

  defp calc_profit([], curr_max, _curr_min), do: curr_max

  defp calc_profit([price | prices], curr_max, curr_min) do
    calc_profit(prices, new_max(price - curr_min, curr_max), new_min(price, curr_min))
  end

  defp new_max(diff, curr_max) when diff > curr_max, do: diff
  defp new_max(_diff, curr_max), do: curr_max

  defp new_min(price, curr_min) when price < curr_min, do: price
  defp new_min(_price, curr_min), do: curr_min
end
