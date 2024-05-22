defmodule StringToInteger8Test do
  use ExUnit.Case
  alias StringToInteger8

  test "Case 1" do
    s = "42"
    assert StringToInteger8.my_atoi(s) == 42
  end

  test "Case 2" do
    s = "   -042"
    assert StringToInteger8.my_atoi(s) == -42
  end

  test "Case 3" do
    s = "1337c0d3"
    assert StringToInteger8.my_atoi(s) == 1337
  end

  test "Case 4" do
    s = "0-1"
    assert StringToInteger8.my_atoi(s) == 0
  end

  test "Case 5" do
    s = "words and 987"
    assert StringToInteger8.my_atoi(s) == 0
  end

  test "Case 6" do
    s = "-91283472332"
    assert StringToInteger8.my_atoi(s) == -2_147_483_648
  end

  test "Case 7" do
    s = "+1"
    assert StringToInteger8.my_atoi(s) == 1
  end

  test "Case 8" do
    s = "+-12"
    assert StringToInteger8.my_atoi(s) == 0
  end

  test "Case 9" do
    s = "-5-"
    assert StringToInteger8.my_atoi(s) == -5
  end
end
