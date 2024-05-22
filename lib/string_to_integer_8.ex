defmodule StringToInteger8 do
  @moduledoc """

  https://leetcode.com/problems/string-to-integer-atoi/

  Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer.

  The algorithm for myAtoi(string s) is as follows:

  Whitespace: Ignore any leading whitespace (" ").
  Signedness: Determine the sign by checking if the next character is '-' or '+', assuming positivity is neither present.
  Conversion: Read the integer by skipping leading zeros until a non-digit character is encountered or the end of the string is reached. If no digits were read, then the result is 0.
  Rounding: If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then round the integer to remain in the range. Specifically, integers less than -231 should be rounded to -231, and integers greater than 231 - 1 should be rounded to 231 - 1.
  Return the integer as the final result.


  Example 1:

  Input: s = "42"

  Output: 42

  Explanation:

  The underlined characters are what is read in and the caret is the current reader position.
  Step 1: "42" (no characters read because there is no leading whitespace)
         ^
  Step 2: "42" (no characters read because there is neither a '-' nor '+')
         ^
  Step 3: "42" ("42" is read in)
           ^
  Example 2:

  Input: s = " -042"

  Output: -42

  Explanation:

  Step 1: "   -042" (leading whitespace is read and ignored)
            ^
  Step 2: "   -042" ('-' is read, so the result should be negative)
             ^
  Step 3: "   -042" ("042" is read in, leading zeros ignored in the result)
               ^
  Example 3:

  Input: s = "1337c0d3"

  Output: 1337

  Explanation:

  Step 1: "1337c0d3" (no characters read because there is no leading whitespace)
         ^
  Step 2: "1337c0d3" (no characters read because there is neither a '-' nor '+')
         ^
  Step 3: "1337c0d3" ("1337" is read in; reading stops because the next character is a non-digit)
             ^
  Example 4:

  Input: s = "0-1"

  Output: 0

  Explanation:

  Step 1: "0-1" (no characters read because there is no leading whitespace)
         ^
  Step 2: "0-1" (no characters read because there is neither a '-' nor '+')
         ^
  Step 3: "0-1" ("0" is read in; reading stops because the next character is a non-digit)
          ^
  Example 5:

  Input: s = "words and 987"

  Output: 0

  Explanation:

  Reading stops at the first non-digit character 'w'.


  Constraints:

  0 <= s.length <= 200
  s consists of English letters (lower-case and upper-case), digits (0-9), ' ', '+', '-', and '.'.
  """
  @lower_bound -2_147_483_648
  @upper_bound 2_147_483_647
  @ints ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  @spec my_atoi(s :: String.t()) :: integer
  def my_atoi(s) do
    s
    |> String.graphemes()
    |> Enum.reduce_while([], fn s, res -> cases(res, s) end)
    |> build(0, 0)
    |> bounds()
  end

  defp cases([], "-"), do: {:cont, [-1]}
  defp cases([], " "), do: {:cont, []}
  defp cases([], "+"), do: {:cont, ["+"]}
  defp cases(res, "-"), do: {:halt, res}
  defp cases(res, s) when s in @ints, do: {:cont, [String.to_integer(s) | res]}
  defp cases(res, _s), do: {:halt, res}

  defp bounds(int) when int < @lower_bound, do: @lower_bound
  defp bounds(int) when int > @upper_bound, do: @upper_bound
  defp bounds(int), do: int

  defp build([], res, _size), do: res
  defp build([last], res, _size) when last == -1, do: res * -1
  defp build([ele | input], res, idx) when ele == "+", do: build(input, res, idx)
  defp build([ele | input], res, idx), do: build(input, res + ele * Integer.pow(10, idx), idx + 1)
end
