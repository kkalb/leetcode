defmodule ZigZagConversion6 do
  @moduledoc """

  https://leetcode.com/problems/zigzag-conversion/

  The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

  P   A   H   N
  A P L S I I G
  Y   I   R
  And then read line by line: "PAHNAPLSIIGYIR"

  Write the code that will take a string and make this conversion given a number of rows:

  string convert(string s, int numRows);


  Example 1:

  Input: s = "PAYPALISHIRING", numRows = 3
  Output: "PAHNAPLSIIGYIR"
  Example 2:

  Input: s = "PAYPALISHIRING", numRows = 4
  Output: "PINALSIGYAHRPI"
  Explanation:
  P     I    N
  A   L S  I G
  Y A   H R
  P     I
  Example 3:

  Input: s = "A", numRows = 1
  Output: "A"


  Constraints:

  1 <= s.length <= 1000
  s consists of English letters (lower-case and upper-case), ',' and '.'.
  1 <= numRows <= 1000
  """

  @doc """
          0 1 2 3 4 5 6
          _ _ _ _ _ _ _
      0 | P   A   H   N
      1 | A P L S I I G
      2 | Y   I   R

          0 1 2 3 4 5 6
          _ _ _ _ _ _ _
      0 | P     I     N
      1 | A   L S   I G
      2 | Y A   H R
      3 | P     I
  """

  @spec convert(s :: String.t(), num_rows :: integer) :: String.t()
  def convert(s, 1), do: s

  # faster for n=2 than the dynamic one for all n
  def convert(s, 2) do
    s
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.reduce({[], []}, fn {s, i}, {left, right} -> put_left_right(s, i, left, right) end)
    |> then(fn {left, right} -> Enum.concat(right, left) end)
    |> Enum.reverse()
    |> Enum.join()
  end

  def convert(s, num_rows) do
    s
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.reduce(base_map(num_rows), fn {s, i}, output ->
      # num_rows 4
      zig = num_rows
      # zag 2
      zag = num_rows - 2
      # zig_zag 6
      zig_zag = zig + zag
      # 0 1 2
      i_zig_zag = div(i, zig_zag)
      # 0 3 6
      col_zig_zag = i_zig_zag * (zig - 1)
      # 0  1  2  3  4  5
      rest = Integer.mod(i, zig_zag)

      {row, col} =
        if rest - zag < 2 do
          # vertical
          {rest, col_zig_zag}
        else
          # zagging
          {zig_zag - rest, col_zig_zag + (rest - zag - 1)}
        end

      update(output, row, col, to_string(s))
    end)
    |> build_word()
  end

  defp put_left_right(s, i, left, right) when rem(i, 2) == 0, do: {[s | left], right}
  defp put_left_right(s, _i, left, right), do: {left, [s | right]}

  # %{
  #   0 => %{0 => "P.", 3 => "I.", 6 => "N."},
  #   1 => %{0 => "A.", 2 => "L.", 3 => "S.", 5 => "I.", 6 => "G."},
  #   2 => %{0 => "Y.", 1 => "A.", 3 => "H.", 4 => "R."},
  #   3 => %{0 => "P.", 3 => "I."}
  # }
  defp build_word(map) do
    Enum.reduce_while(0..1_000_000, [], fn i, res ->
      if ele = Map.get(map, i) do
        {:cont, [ele | res]}
      else
        {:halt, Enum.reverse(res)}
      end
    end)
    |> Enum.map_join("", fn inner ->
      inner
      |> Enum.sort_by(fn {i, _s} -> i end)
      |> Enum.map_join("", fn {_i, s} -> s end)
    end)
  end

  defp update(output, x, y, value) do
    update_in(output, [x], fn row -> Map.put(row, y, value) end)
  end

  defp base_map(num_rows), do: for(i <- 0..(num_rows - 1), into: %{}, do: {i, %{}})
end
