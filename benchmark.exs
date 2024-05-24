nums_2 = [2, 3]
nums_4 = [2, 3, 1, 0]
nums_8 = [2, 3, 1, 0, 1, 3, 2, 1]

nums_16 = nums_8 ++ nums_8
nums_32 = nums_16 ++ nums_16
nums_64 = nums_32 ++ nums_32
nums_128 = nums_64 ++ nums_64
nums_256 = nums_128 ++ nums_128
nums_512 = nums_256 ++ nums_256
nums_1028 = nums_512 ++ nums_512

Benchee.run(%{
  "2" => fn -> JumpGame55.can_jump(nums_2) end,
  "4" => fn -> JumpGame55.can_jump(nums_4) end,
  "8" => fn -> JumpGame55.can_jump(nums_8) end,
  "16" => fn -> JumpGame55.can_jump(nums_16) end,
  "32" => fn -> JumpGame55.can_jump(nums_32) end,
  "64" => fn -> JumpGame55.can_jump(nums_64) end,
  "128" => fn -> JumpGame55.can_jump(nums_128) end,
  "256" => fn -> JumpGame55.can_jump(nums_256) end,
  "512" => fn -> JumpGame55.can_jump(nums_512) end,
  "1028" => fn -> JumpGame55.can_jump(nums_1028) end,
  },
  print: %{
    configuration: false
  },
warmup: 1,
time: 5,
memory_time: 5
)
