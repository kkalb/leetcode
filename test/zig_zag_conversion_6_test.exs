defmodule ZigZagConversion6Test do
  use ExUnit.Case
  alias ZigZagConversion6

  test "Case 1" do
    s = "PAYPALISHIRING"
    n = 3
    output = "PAHNAPLSIIGYIR"
    assert ZigZagConversion6.convert(s, n) == output
  end

  test "Case 2" do
    s = "PAYPALISHIRING"
    n = 4
    output = "PINALSIGYAHRPI"
    assert ZigZagConversion6.convert(s, n) == output
  end

  test "Case 3" do
    s = "A"
    n = 1
    output = "A"
    assert ZigZagConversion6.convert(s, n) == output
  end

  test "Case 4" do
    s =
      "Apalindromeisaword,phrase,number,orothersequenceofunitsthatcanbereadthesamewayineitherdirection,withgeneralallowancesforadjustmentstopunctuationandworddividers."

    n = 2

    output =
      "Aaidoeswr,haenme,rtesqecouishtabrateaeaietedrcinwtgnrlloacsoajsmnsoucutoadodiiesplnrmiaodprs,ubroohreunefnttacneedhsmwynihrieto,iheeaalwnefrdutettpntainnwrdvdr."

    assert ZigZagConversion6.convert(s, n) == output
  end

  test "Case 5" do
    s =
      "Apalindromeisaword,phrase,number,orothersequenceofunitsthatcanbereadthesamewayineitherdirection,withgeneralallowancesforadjustmentstopunctuationandworddividers."

    n = 3

    output =
      "Aiosrhem,tseoihartaaeeriwgrlasasnoctaoieplnrmiaodprs,ubroohreunefnttacneedhsmwynihrieto,iheeaalwnefrdutettpntainnwrdvdr.adew,anereqcustbaeeitdcntnlocojmsuuoddis"

    assert ZigZagConversion6.convert(s, n) == output
  end
end
