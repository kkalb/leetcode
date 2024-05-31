defmodule TrappingRainWater42Test do
  use ExUnit.Case
  alias TrappingRainWater42

  test "Case 1" do
    height = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
    output = 6

    assert TrappingRainWater42.trap(height) == output
  end

  test "Case 2" do
    height = [4, 2, 0, 3, 2, 5]
    output = 9

    assert TrappingRainWater42.trap(height) == output
  end

  test "Case 3" do
    height = [0]
    output = 0

    assert TrappingRainWater42.trap(height) == output
  end

  test "Case 4" do
    height = [2, 0, 2]
    output = 2

    assert TrappingRainWater42.trap(height) == output
  end

  test "Case 5" do
    height = [2, 1, 0, 2]
    output = 3

    assert TrappingRainWater42.trap(height) == output
  end

  test "Case 6" do
    height = [5, 5, 1, 7, 1, 1, 5, 2, 7, 6]
    output = 23

    assert TrappingRainWater42.trap(height) == output
  end

  @tag timeout: 120_000
  test "Case 7" do
    # before preflooding 3.0s
    # with calc of preflooding its the same :)

    height =
      "data/height.csv"
      |> File.stream!([read_ahead: 100_000], 1000)
      |> CSV.decode!(separator: ?,, headers: false)
      |> Enum.at(0)
      |> Enum.map(&String.to_integer/1)

    assert TrappingRainWater42.trap(height) == 174_801_674
  end

  @tag timeout: 120_000
  test "Case 8" do
    height = Enum.to_list(100_000..90_001) |> Enum.intersperse(0)
    # takes 9.4 s without flooding
    # takes 9.7 - 10 s with flood precalculation without applying
    assert TrappingRainWater42.trap(height) == 949_905_000
  end

  test "Case 9 flood" do
    height = [4, 0, 5, 3, 2, 1, 2, 3, 5, 0, 4]
    output = 22

    assert TrappingRainWater42.trap(height) == output
  end
end
