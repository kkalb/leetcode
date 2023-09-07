defmodule ValidParentheses20 do
  @moduledoc """

  https://leetcode.com/problems/valid-parentheses/?envType=study-plan-v2&envId=top-interview-150

  Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

  An input string is valid if:

  Open brackets must be closed by the same type of brackets.
  Open brackets must be closed in the correct order.
  Every close bracket has a corresponding open bracket of the same type.


  Example 1:

  Input: s = "()"
  Output: true
  Example 2:

  Input: s = "()[]{}"
  Output: true
  Example 3:

  Input: s = "(]"
  Output: false


  Constraints:

  1 <= s.length <= 104
  s consists of parentheses only '()[]{}'.
  """

  @spec is_valid(s :: String.t()) :: boolean
  def is_valid(s) do
    [f | rest] = String.graphemes(s)

    Enum.reduce_while(rest, [f], fn next, stack ->
      last_item_on_stack = List.last(stack)
      new_stack = may_remove(stack, last_item_on_stack, next)

      case new_stack do
        nil -> {:halt, [nil]}
        _ -> {:cont, new_stack}
      end
    end) == []
  end

  defp may_remove(stack, "{", "}"), do: List.delete_at(stack, -1)
  defp may_remove(stack, "(", ")"), do: List.delete_at(stack, -1)
  defp may_remove(stack, "[", "]"), do: List.delete_at(stack, -1)

  defp may_remove(_stack, "{", ")"), do: nil
  defp may_remove(_stack, "[", ")"), do: nil
  defp may_remove(_stack, "(", "}"), do: nil
  defp may_remove(_stack, "[", "}"), do: nil
  defp may_remove(_stack, "(", "]"), do: nil
  defp may_remove(_stack, "{", "]"), do: nil

  defp may_remove(stack, _, new_ele), do: List.insert_at(stack, -1, new_ele)
end
