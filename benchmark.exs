height = Enum.to_list(100_000..0) |> Enum.intersperse(0)

Benchee.run(%{
  "first" => fn -> TrappingRainWater42.trap(height) end,
  },
  print: %{
    configuration: false
  },
warmup: 2,
time: 120,
memory_time: 120,
profile_after: true
)
