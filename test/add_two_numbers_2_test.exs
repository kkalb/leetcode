defmodule AddTwoNumbers2Test do
  use ExUnit.Case
  alias AddTwoNumbers2
  alias ListNode

  test "Case 1" do
    l1 = %ListNode{val: 2, next: %ListNode{val: 4, next: %ListNode{val: 3, next: nil}}}

    l2 = %ListNode{val: 5, next: %ListNode{val: 6, next: %ListNode{val: 4, next: nil}}}

    r = %ListNode{val: 7, next: %ListNode{val: 0, next: %ListNode{val: 8, next: nil}}}

    assert AddTwoNumbers2.add_two_numbers(l1, l2) == r
  end

  test "Case 2" do
    node = %ListNode{val: 0, next: nil}

    assert AddTwoNumbers2.add_two_numbers(node, node) == node
  end

  test "Case 3" do
    l1 = %ListNode{
      val: 9,
      next: %ListNode{
        val: 9,
        next: %ListNode{
          val: 9,
          next: %ListNode{
            val: 9,
            next: %ListNode{val: 9, next: %ListNode{val: 9, next: %ListNode{val: 9, next: nil}}}
          }
        }
      }
    }

    l2 = %ListNode{
      val: 9,
      next: %ListNode{val: 9, next: %ListNode{val: 9, next: %ListNode{val: 9, next: nil}}}
    }

    r = %ListNode{
      val: 8,
      next: %ListNode{
        val: 9,
        next: %ListNode{
          val: 9,
          next: %ListNode{
            val: 9,
            next: %ListNode{
              val: 0,
              next: %ListNode{val: 0, next: %ListNode{val: 0, next: %ListNode{val: 1, next: nil}}}
            }
          }
        }
      }
    }

    assert AddTwoNumbers2.add_two_numbers(l1, l2) == r
  end
end
