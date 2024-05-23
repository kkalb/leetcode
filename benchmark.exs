a = "0"
b = "0"

Benchee.run(%{
  "pattern_matching" => fn -> AddBinary67.add_binary(a, b) end,
  "native_elixir" => fn -> (String.to_integer(a,2) + String.to_integer(b,2)) |> Integer.to_string(2) end,
  },
warmup: 1,
time: 5,
memory_time: 2
)
