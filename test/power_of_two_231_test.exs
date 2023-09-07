defmodule PowerOfTwo231Test do
  @moduledoc """
  Tests for isomorphic strings.
  """
  use ExUnit.Case
  import PowerOfTwo231

  test "Case 1" do
    n = 1

    result = is_power_of_two(n)

    assert result == true
  end

  test "Case 2" do
    n = 16

    result = is_power_of_two(n)

    assert result == true
  end

  test "Case 3" do
    n = 3

    result = is_power_of_two(n)

    assert result == false
  end

  test "Case 4" do
    n = 8

    result = is_power_of_two(n)

    assert result == true
  end
end
