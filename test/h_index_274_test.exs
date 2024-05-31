defmodule HIndex274Test do
  use ExUnit.Case
  alias HIndex274

  test "Case 1" do
    citations = [3, 0, 6, 1, 5]

    assert HIndex274.h_index(citations) == 3
  end

  test "Case 2" do
    citations = [1, 3, 1]

    assert HIndex274.h_index(citations) == 1
  end

  test "Case 3" do
    citations = [1]

    assert HIndex274.h_index(citations) == 1
  end

  test "Case 4" do
    citations = [0]

    assert HIndex274.h_index(citations) == 0
  end

  test "Case 5" do
    citations = [11, 15]

    assert HIndex274.h_index(citations) == 2
  end

  test "Case 6" do
    citations = [0, 0]

    assert HIndex274.h_index(citations) == 0
  end
end
