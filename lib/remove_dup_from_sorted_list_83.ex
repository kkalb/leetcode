defmodule RemoveDupFromSortedList83 do
  @moduledoc """

  https://leetcode.com/problems/remove-duplicates-from-sorted-list/

  Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

  Example 1:


  Input: head = [1,1,2]
  Output: [1,2]
  Example 2:


  Input: head = [1,1,2,3,3]
  Output: [1,2,3]


  Constraints:

  The number of nodes in the list is in the range [0, 300].
  -100 <= Node.val <= 100
  The list is guaranteed to be sorted in ascending order.
  """

  @spec delete_duplicates(head :: ListNode.t() | nil) :: ListNode.t() | nil
  def delete_duplicates(linked_list), do: solve(linked_list, []) |> Enum.reverse() |> build()

  defp solve(nil, res), do: res

  defp solve(%ListNode{val: val1, next: nil}, [last_ele | _res] = res) when val1 == last_ele,
    do: res

  defp solve(%ListNode{val: val1, next: nil}, res), do: [val1 | res]

  defp solve(%ListNode{val: val1, next: next}, [val2 | _rest] = result)
       when val1 == val2,
       do: solve(next, result)

  defp solve(%ListNode{val: val1, next: next}, result),
    do: solve(next, [val1 | result])

  defp build([]), do: nil
  defp build([ele]), do: %ListNode{val: ele, next: nil}
  defp build([ele | rest]), do: %ListNode{val: ele, next: build(rest)}
end
