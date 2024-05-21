defmodule IsPalindrom9Test do
  use ExUnit.Case
  alias IsPalindrom9

  test "Case 1" do
    assert IsPalindrom9.is_palindrome(121)
  end

  test "Case 2" do
    refute IsPalindrom9.is_palindrome(-121)
  end

  test "Case 3" do
    refute IsPalindrom9.is_palindrome(10)
  end
end
