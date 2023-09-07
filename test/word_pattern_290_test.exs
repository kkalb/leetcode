defmodule WordPattern290Test do
  @moduledoc """
  Tests for isomorphic strings.
  """
  use ExUnit.Case
  alias WordPattern290

  test "Case 1" do
    pattern = "abba"
    s = "dog cat cat dog"

    assert WordPattern290.word_pattern(pattern, s) == true
  end

  test "Case 2" do
    pattern = "abba"
    s = "dog cat cat fish"

    assert WordPattern290.word_pattern(pattern, s) == false
  end

  test "Case 3" do
    pattern = "aaaa"
    s = "dog cat cat dog"

    assert WordPattern290.word_pattern(pattern, s) == false
  end

  test "Failed test in first submit" do
    pattern = "abba"
    s = "dog dog dog dog"

    assert WordPattern290.word_pattern(pattern, s) == false
  end
end
