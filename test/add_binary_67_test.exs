defmodule AddBinary67Test do
  use ExUnit.Case
  alias AddBinary67

  test "Case 1" do
    a = "11"
    b = "1"
    output = "100"
    assert AddBinary67.add_binary(a, b) == output
  end

  test "Case 2" do
    a = "1010"
    b = "1011"
    output = "10101"
    assert AddBinary67.add_binary(a, b) == output
  end

  test "Case 3" do
    a = "111"
    b = "1010"
    output = "10001"
    assert AddBinary67.add_binary(a, b) == output
  end

  test "Case 4" do
    a = "0"
    b = "0"
    output = "0"
    assert AddBinary67.add_binary(a, b) == output
  end

  test "Case 5" do
    a = "100"
    b = "110010"
    output = "110110"
    assert AddBinary67.add_binary(a, b) == output
  end

  test "Case 6" do
    a = "101111"
    b = "10"
    output = "110001"
    assert AddBinary67.add_binary(a, b) == output
  end

  test "Case 7" do
    a = "11"
    b = "1001"
    output = "1100"
    assert AddBinary67.add_binary(a, b) == output
  end

  test "Case 8" do
    a = "110010"
    b = "10111"
    output = "1001001"
    assert AddBinary67.add_binary(a, b) == output
  end

  test "Case 9" do
    a = "1111"
    b = "1111"
    output = "11110"
    assert AddBinary67.add_binary(a, b) == output
  end

  test "Case 10" do
    a = "100010"
    b = "11"
    output = "100101"
    assert AddBinary67.add_binary(a, b) == output
  end
end
