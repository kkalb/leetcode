defmodule SearchInsertPosition35Test do
  use ExUnit.Case
  alias SearchInsertPosition35

  test "Case 1" do
    s = [1, 3, 5, 6]
    t = 5

    assert SearchInsertPosition35.search_insert(s, t) == 2
  end

  test "Case 2" do
    s = [1, 3, 5, 6]
    t = 2

    assert SearchInsertPosition35.search_insert(s, t) == 1
  end

  test "Case 3" do
    s = [1, 3, 5, 6]
    t = 7

    assert SearchInsertPosition35.search_insert(s, t) == 4
  end
end
