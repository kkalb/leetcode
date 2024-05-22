defmodule ReverseInteger7Test do
  use ExUnit.Case
  alias ReverseInteger7

  test "Case 1" do
    assert ReverseInteger7.reverse(123) == 321
  end

  test "Case 2" do
    assert ReverseInteger7.reverse(-123) == -321
  end

  test "Case 3" do
    assert ReverseInteger7.reverse(120) == 21
  end
end
