defmodule HIndex274 do
  @moduledoc """

  https://leetcode.com/problems/h-index/?envType=study-plan-v2&envId=top-interview-150

  Given an array of integers citations where citations[i] is the number of citations a researcher received for their ith paper, return the researcher's h-index.

  According to the definition of h-index on Wikipedia: The h-index is defined as the maximum value of h such that the given researcher has published at least h papers that have each been cited at least h times.


  Example 1:

  Input: citations = [3,0,6,1,5]
  Output: 3
  Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had received 3, 0, 6, 1, 5 citations respectively.
  Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, their h-index is 3.


  Example 2:

  Input: citations = [1,3,1]
  Output: 1


  Constraints:

  n == citations.length
  1 <= n <= 5000
  0 <= citations[i] <= 1000
  """

  @spec h_index(citations :: [integer]) :: integer
  def h_index(citations) do
    calc(Enum.sort(citations), 0, length(citations), 0)
  end

  defp calc([], _idx, _length, h_index), do: h_index
  defp calc([cit | _citations], idx, length, _h_index) when cit == length - idx, do: cit

  defp calc([cit | citations], idx, length, h_index) when length - idx > cit do
    calc(citations, idx + 1, length, h_index)
  end

  defp calc([_cit | citations], idx, length, h_index) do
    calc(citations, idx + 1, length, max(length - idx, h_index))
  end
end
