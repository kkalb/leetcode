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
    height =
      "data/height.csv"
      |> File.stream!([read_ahead: 100_000], 1000)
      |> CSV.decode!(separator: ?,, headers: false)
      |> Enum.at(0)
      |> Enum.map(&String.to_integer/1)

    assert TrappingRainWater42.trap(height) == 10
  end
end
