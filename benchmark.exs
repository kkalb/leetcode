s2 = "Ap"
s4 = "Apal"
s8 = "Apalindr"
s16 = "Apalindromeisawo"
s32 = "Apalindromeisaword,phrase,number"
s64 =  "Apalindromeisaword,phrase,number,orothersequenceofunitsthatcanbe"
s128 = "Apalindromeisaword,phrase,number,orothersequenceofunitsthatcanbereadthesamewayineitherdirection,withgeneralallowancesforadjustme"

Benchee.run(%{
  "2" => fn -> ZigZagConversion6.convert(s2, 4) end,
  "4" => fn -> ZigZagConversion6.convert(s4, 4) end,
  "8" => fn -> ZigZagConversion6.convert(s8, 4) end,
  "16" => fn -> ZigZagConversion6.convert(s16, 4) end,
  "32" => fn -> ZigZagConversion6.convert(s32, 4) end,
  "64" => fn -> ZigZagConversion6.convert(s64, 4) end,
  "128" => fn -> ZigZagConversion6.convert(s128, 4) end
  },
warmup: 1,
time: 5,
memory_time: 2
)
