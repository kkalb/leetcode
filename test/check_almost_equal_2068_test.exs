defmodule CheckAlmostEqual2068Test do
  use ExUnit.Case
  alias CheckAlmostEqual2068

  test "Case 1" do
    word1 = "aaaa"
    word2 = "bccb"

    refute CheckAlmostEqual2068.check_almost_equivalent(word1, word2)
  end

  test "Case 2" do
    word1 = "abcdeef"
    word2 = "abaaacc"

    assert CheckAlmostEqual2068.check_almost_equivalent(word1, word2)
  end

  test "Case 3" do
    word1 = "cccddabba"
    word2 = "babababab"

    assert CheckAlmostEqual2068.check_almost_equivalent(word1, word2)
  end

  test "Case 4" do
    word1 =
      "bddhdfcdihfehbehfeiccehhchbibiggifcbgieedgfhggebcbeeddfdfiehcigdfcccdhgchbbfheddbdbiifeeiieg"

    word2 =
      "cdecdhhfgdieiifhhifffcgddeehgbciceggedbdggbigiieidgcceccgfhiecdefdhighbfdcdbgcfddeebbgibcihe"

    refute CheckAlmostEqual2068.check_almost_equivalent(word1, word2)
  end
end
