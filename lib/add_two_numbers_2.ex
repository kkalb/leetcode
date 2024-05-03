defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule AddTwoNumbers2 do
  @moduledoc """

  https://leetcode.com/problems/add-two-numbers/description/

  You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

  You may assume the two numbers do not contain any leading zero, except the number 0 itself.

  Example 1:

  Input: l1 = [2,4,3], l2 = [5,6,4]
  Output: [7,0,8]
  Explanation: 342 + 465 = 807.
  Example 2:

  Input: l1 = [0], l2 = [0]
  Output: [0]
  Example 3:

  Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
  Output: [8,9,9,9,0,0,0,1]


  Constraints:

  The number of nodes in each linked list is in the range [1, 100].
  0 <= Node.val <= 9
  It is guaranteed that the list represents a number that does not have leading zeros.
  """

  @spec add_two_numbers(l1 :: ListNode.t() | nil, l2 :: ListNode.t() | nil) :: ListNode.t() | nil
  def add_two_numbers(l1, l2), do: do_add_two_numbers(l1, l2, 0)

  defp do_add_two_numbers(nil, nil, 0), do: nil
  defp do_add_two_numbers(nil, nil, 1), do: %ListNode{val: 1, next: nil}

  defp do_add_two_numbers(nil, l2, overflow),
    do: do_add_two_numbers(l2, %ListNode{val: 0, next: nil}, overflow)

  defp do_add_two_numbers(l1, nil, overflow),
    do: do_add_two_numbers(l1, %ListNode{val: 0, next: nil}, overflow)

  defp do_add_two_numbers(l1, l2, overflow) do
    sum = l1.val + l2.val + overflow
    {over, sum} = if sum > 9, do: {1, sum - 10}, else: {0, sum}

    %ListNode{val: sum, next: do_add_two_numbers(l1.next, l2.next, over)}
  end
end
