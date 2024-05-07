defmodule MergeTwoSortedLists21 do
  @moduledoc """

  https://leetcode.com/problems/merge-two-sorted-lists/description/

  You are given the heads of two sorted linked lists list1 and list2.

  Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

  Return the head of the merged linked list.


  Example 1:


  Input: list1 = [1,2,4], list2 = [1,3,4]
  Output: [1,1,2,3,4,4]
  Example 2:

  Input: list1 = [], list2 = []
  Output: []
  Example 3:

  Input: list1 = [], list2 = [0]
  Output: [0]
  """
  @spec merge_two_lists(list1 :: ListNode.t() | nil, list2 :: ListNode.t() | nil) ::
          ListNode.t() | nil
  def merge_two_lists(list1, list2), do: merge(list1, list2)
  defp merge(ln, nil), do: ln
  defp merge(nil, ln), do: ln

  defp merge(ln1, ln2) when ln1.val == ln2.val,
    do: %ListNode{val: ln1.val, next: %ListNode{val: ln2.val, next: merge(ln1.next, ln2.next)}}

  defp merge(ln1, ln2) when ln1.val < ln2.val,
    do: %ListNode{val: ln1.val, next: merge(ln1.next, ln2)}

  defp merge(ln1, ln2) when ln1.val > ln2.val,
    do: %ListNode{val: ln2.val, next: merge(ln1, ln2.next)}
end

defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end
