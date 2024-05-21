defmodule SortList148Test do
  use ExUnit.Case
  alias SortList148

  test "Case 1" do
    list = %ListNode{
      val: 4,
      next: %ListNode{val: 2, next: %ListNode{val: 1, next: %ListNode{val: 3, next: nil}}}
    }

    sorted = %ListNode{
      val: 1,
      next: %ListNode{val: 2, next: %ListNode{val: 3, next: %ListNode{val: 4, next: nil}}}
    }

    assert SortList148.sort_list(list) == sorted
  end
end
