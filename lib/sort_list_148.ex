defmodule SortList148 do
  @moduledoc """

  https://leetcode.com/problems/sort-list/description/

  Given the head of a linked list, return the list after sorting it in ascending order.

  Example 1:

  Input: head = [4,2,1,3]
  Output: [1,2,3,4]
  Example 2:


  Input: head = [-1,5,3,4,0]
  Output: [-1,0,3,4,5]
  Example 3:

  Input: head = []
  Output: []


  Constraints:

  The number of nodes in the list is in the range [0, 5 * 104].
  -105 <= Node.val <= 105


  Follow up: Can you sort the linked list in O(n logn) time and O(1) memory (i.e. constant space)?
  """
  @spec sort_list(head :: ListNode.t() | nil) :: ListNode.t() | nil
  def sort_list(nil) do
    nil
  end

  def sort_list(head) do
    sort(head, [])
  end

  defp sort(%ListNode{val: val, next: nil}, vals) do
    [val | vals] |> Enum.sort() |> build()
  end

  defp sort(%ListNode{val: val, next: next}, vals) do
    sort(next, [val | vals])
  end

  defp build([ele]) do
    %ListNode{val: ele, next: nil}
  end

  defp build([ele | list]) do
    %ListNode{val: ele, next: build(list)}
  end
end
