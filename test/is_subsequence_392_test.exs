defmodule IsSubsequence392Test do
  @moduledoc """
  asdasd
  """
  use ExUnit.Case
  alias IsSubsequence392

  test "Case 1" do
    s = "abc"
    t = "ahbgdc"

    assert IsSubsequence392.is_subsequence(s, t)
  end

  test "Case 2" do
    s = "axc"
    t = "ahbgdc"

    refute IsSubsequence392.is_subsequence(s, t)
  end

  test "Case 3" do
    s = ""
    t = "ahbgdc"

    assert IsSubsequence392.is_subsequence(s, t)
  end
end
