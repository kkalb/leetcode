defmodule ValidParentheses20Test do
  @moduledoc false
  use ExUnit.Case
  import ValidParentheses20

  test "Case 1" do
    s = "()"

    result = is_valid(s)
    assert result == true
  end

  test "Case 2" do
    s = "()[]{}"

    result = is_valid(s)
    assert result == true
  end

  test "Case 3" do
    s = "(]"

    result = is_valid(s)
    assert result == false
  end

  test "Case 4" do
    s = "([)]"

    result = is_valid(s)
    assert result == false
  end
end
