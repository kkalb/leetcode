Benchee.run(%{"first" => fn input -> MajorityElement169.majority_element(input) end},
inputs: %{
  "MajorOutter" => [3, 2, 3],
  "MajorFirst" => [3, 3, 4],
  "MajorLast" => [6, 5, 5],
  "Large" => [2, 2, 1, 1, 1, 2, 2]
},
warmup: 1,
time: 3,
parallel: 1,
profile_after: false,
print: [
  configuration: false,
  fast_warning: true
]
)
