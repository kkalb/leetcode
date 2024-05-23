nums1 = [2, 2, 3, 2]
nums2 = [0, 1, 0, 1, 0, 1, 99]
nums3 = [4, 0, 3, 1, 0, 3, 1, 4, 0, 1, 99, 3, 4]
nums4 = [123, 2, 4, 0, 123, 3, 2, 88, 1, 123, 117, 0, 3, 1, 2, 4, 0, 117, 117, 1, 88, 99, 3, 88, 4]
nums5 = [123, 2, 4, 0, 77, 123, 3, 2, 88, 1, 123, 117, 0, 3, 77, 1, 2, 4, 0, 117, 117, 1, 88, 99, 3, 88, 4, 77]

Benchee.run(%{
  "4" => fn -> SingleNumberTwo137.single_number(nums1) end,
  "7" => fn -> SingleNumberTwo137.single_number(nums2) end,
  "13" => fn -> SingleNumberTwo137.single_number(nums3) end,
  "25" => fn -> SingleNumberTwo137.single_number(nums4) end,
  "28" => fn -> SingleNumberTwo137.single_number(nums5) end,
  },
warmup: 1,
time: 5,
memory_time: 2
)
