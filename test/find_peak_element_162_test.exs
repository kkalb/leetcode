defmodule FindPeakElement162Test do
  use ExUnit.Case
  alias FindPeakElement162

  test "Case 1" do
    nums = [1, 2, 3, 1]
    assert FindPeakElement162.find_peak_element(nums) == 2
  end

  test "Case 2" do
    nums = [1, 2, 1, 3, 5, 6, 4]
    possible_peaks = [1, 5]
    assert FindPeakElement162.find_peak_element(nums) in possible_peaks
  end
end
