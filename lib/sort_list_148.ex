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
  def sort_list(head) do
    sort_lists(head)
  end

  def split(head) do
    split(head, head, nil)
  end

  defp split(nil, _slow, prev) do
    {prev, nil}
  end

  defp split(_fast, nil, slow) do
    {slow, nil}
  end

  defp split(fast, slow, _prev) do
    if fast.next == nil do
      {slow, slow.next}
    else
      split(fast.next.next, slow.next, slow)
    end
  end

  # Merge two sorted linked lists
  def merge(nil, l2), do: l2
  def merge(l1, nil), do: l1

  def merge(l1, l2) do
    if l1.val <= l2.val do
      %ListNode{val: l1.val, next: merge(l1.next, l2)}
    else
      %ListNode{val: l2.val, next: merge(l1, l2.next)}
    end
  end

  # Recursive merge sort for the linked list
  def sort_lists(nil), do: nil
  def sort_lists(%ListNode{next: nil} = head), do: head

  def sort_lists(nil, nil), do: nil

  def sort_lists(%ListNode{next: %ListNode{next: nil}} = _head, nil),
    do: %ListNode{next: nil}

  def sort_lists(head) do
    {left_half, right_start} = split(head)
    # Split into two separate lists

    left_sorted = sort_lists(left_half, nil)
    right_sorted = sort_lists(right_start)

    merge(left_sorted, right_sorted)
  end
end
