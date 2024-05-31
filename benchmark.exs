
citations_1 = [1]
citations_2 = [1, 2]
citations_4 = Enum.concat(citations_2, citations_2)
citations_8 = Enum.concat(citations_4, citations_4)
citations_16 = Enum.concat(citations_8, citations_8)
citations_32 = Enum.concat(citations_16, citations_16)
citations_64 = Enum.concat(citations_32, citations_32)

Benchee.run(%{
  "citations_1" => fn -> HIndex274.h_index(citations_1) end,
  "citations_2" => fn -> HIndex274.h_index(citations_2) end,
  "citations_4" => fn -> HIndex274.h_index(citations_4) end,
  "citations_8" => fn -> HIndex274.h_index(citations_8) end,
  "citations_16" => fn -> HIndex274.h_index(citations_16) end,
  "citations_32" => fn -> HIndex274.h_index(citations_32) end,
  "citations_64" => fn -> HIndex274.h_index(citations_64) end,
  },
  print: %{
    configuration: false
  },
warmup: 2,
time: 5,
memory_time: 2
)
