defmodule ValidSudoku36 do
  @moduledoc """

  https://leetcode.com/problems/valid-sudoku/description/

  Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

  Each row must contain the digits 1-9 without repetition.
  Each column must contain the digits 1-9 without repetition.
  Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
  Note:

  A Sudoku board (partially filled) could be valid but is not necessarily solvable.
  Only the filled cells need to be validated according to the mentioned rules.


  Example 1:


  Input: board =
  [["5","3",".",".","7",".",".",".","."]
  ,["6",".",".","1","9","5",".",".","."]
  ,[".","9","8",".",".",".",".","6","."]
  ,["8",".",".",".","6",".",".",".","3"]
  ,["4",".",".","8",".","3",".",".","1"]
  ,["7",".",".",".","2",".",".",".","6"]
  ,[".","6",".",".",".",".","2","8","."]
  ,[".",".",".","4","1","9",".",".","5"]
  ,[".",".",".",".","8",".",".","7","9"]]
  Output: true
  Example 2:

  Input: board =
  [["8","3",".",".","7",".",".",".","."]
  ,["6",".",".","1","9","5",".",".","."]
  ,[".","9","8",".",".",".",".","6","."]
  ,["8",".",".",".","6",".",".",".","3"]
  ,["4",".",".","8",".","3",".",".","1"]
  ,["7",".",".",".","2",".",".",".","6"]
  ,[".","6",".",".",".",".","2","8","."]
  ,[".",".",".","4","1","9",".",".","5"]
  ,[".",".",".",".","8",".",".","7","9"]]
  Output: false
  Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.


  Constraints:

  board.length == 9
  board[i].length == 9
  board[i][j] is a digit 1-9 or '.'.
  """
  @spec is_valid_sudoku(board :: [[char]]) :: boolean
  def is_valid_sudoku(board) do
    transposed_board = transpose(board)

    row_valid? = check_row(board)
    col_valid? = check_row(transposed_board)
    squares_valid? = board |> build_squares() |> check_row()

    row_valid? && col_valid? && squares_valid?
  end

  defp check_row(board) do
    Enum.reduce_while(board, true, fn row, acc ->
      if check_line(row), do: {:cont, acc}, else: {:halt, false}
    end)
  end

  # on leetcode, we need to use 46 instead of "."
  @codepoint_dot "."
  defp check_line(sequence) do
    sequence
    |> Enum.reject(fn ele -> ele == @codepoint_dot end)
    |> Enum.frequencies()
    |> Enum.all?(fn {_, count} -> count <= 1 end)
  end

  defp transpose(board) do
    Enum.zip_with(board, &Function.identity/1)
  end

  defp build_squares(board) do
    board |> Enum.chunk_every(3) |> Enum.map(&build_square(&1))
  end

  defp build_square(rows) do
    Enum.reduce(rows, [[], [], []], fn row, [x, y, z] ->
      [first, second, third] = Enum.chunk_every(row, 3)
      [x ++ first, y ++ second, z ++ third]
    end)
  end
end
