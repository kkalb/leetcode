defmodule PlusOne66Test do
  use ExUnit.Case
  alias PlusOne66

  test "Case 1" do
    digits = [1, 2, 3]

    assert PlusOne66.plus_one(digits) == [1, 2, 4]
  end

  test "Case 2" do
    digits = [4, 3, 2, 1]

    assert PlusOne66.plus_one(digits) == [4, 3, 2, 2]
  end

  test "Case 3" do
    digits = [9]

    assert PlusOne66.plus_one(digits) == [1, 0]
  end
end
