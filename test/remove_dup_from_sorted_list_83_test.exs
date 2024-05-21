defmodule RemoveDupFromSortedList83Test do
  use ExUnit.Case
  alias RemoveDupFromSortedList83

  test "Case 1" do
    list = %ListNode{val: 1, next: %ListNode{val: 1, next: %ListNode{val: 2, next: nil}}}
    res = %ListNode{val: 1, next: %ListNode{val: 2, next: nil}}

    assert RemoveDupFromSortedList83.delete_duplicates(list) == res
  end

  test "Case 2" do
    list = %ListNode{
      val: 1,
      next: %ListNode{val: 1, next: %ListNode{val: 1, next: %ListNode{val: 1, next: nil}}}
    }

    res = %ListNode{val: 1, next: nil}

    assert RemoveDupFromSortedList83.delete_duplicates(list) == res
  end

  test "Case 3" do
    assert RemoveDupFromSortedList83.delete_duplicates(nil) == nil
  end
end
