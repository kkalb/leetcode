defmodule MergeTwoSortedLists21Test do
  use ExUnit.Case
  alias MergeTwoSortedLists21
  alias ListNode

  test "Case 1" do
    list1 = %ListNode{val: 1, next: %ListNode{val: 2, next: %ListNode{val: 4, next: nil}}}
    list2 = %ListNode{val: 1, next: %ListNode{val: 3, next: %ListNode{val: 4, next: nil}}}

    output = %ListNode{
      val: 1,
      next: %ListNode{
        val: 1,
        next: %ListNode{
          val: 2,
          next: %ListNode{val: 3, next: %ListNode{val: 4, next: %ListNode{val: 4, next: nil}}}
        }
      }
    }

    assert MergeTwoSortedLists21.merge_two_lists(list1, list2) == output
  end
end
