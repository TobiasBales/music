# typed: strict
# frozen_string_literal: true

require "test_helper"

class NoteTest < ActiveSupport::TestCase
  extend T::Sig

  test "deserialize works for valid inputs" do
    assert_not_nil note("abb")
    assert_equal LetterName::A, note("abb").name
    assert_equal Accidental::DoubleFlat, note("abb").accidental

    assert_not_nil note("ab")
    assert_equal LetterName::A, note("ab").name
    assert_equal Accidental::Flat, note("ab").accidental

    assert_not_nil note("a")
    assert_equal LetterName::A, note("a").name
    assert_equal Accidental::Neutral, note("a").accidental

    assert_not_nil note("a#")
    assert_equal LetterName::A, note("a#").name
    assert_equal Accidental::Sharp, note("a#").accidental

    assert_not_nil note("a##")
    assert_equal LetterName::A, note("a##").name
    assert_equal Accidental::DoubleSharp, note("a##").accidental

    assert_not_nil note("bbb")
    assert_equal LetterName::B, note("bbb").name
    assert_equal Accidental::DoubleFlat, note("bbb").accidental

    assert_not_nil note("bb")
    assert_equal LetterName::B, note("bb").name
    assert_equal Accidental::Flat, note("bb").accidental

    assert_not_nil note("b")
    assert_equal LetterName::B, note("b").name
    assert_equal Accidental::Neutral, note("b").accidental

    assert_not_nil note("b#")
    assert_equal LetterName::B, note("b#").name
    assert_equal Accidental::Sharp, note("b#").accidental

    assert_not_nil note("b##")
    assert_equal LetterName::B, note("b##").name
    assert_equal Accidental::DoubleSharp, note("b##").accidental

    assert_not_nil note("cbb")
    assert_equal LetterName::C, note("cbb").name
    assert_equal Accidental::DoubleFlat, note("cbb").accidental

    assert_not_nil note("cb")
    assert_equal LetterName::C, note("cb").name
    assert_equal Accidental::Flat, note("cb").accidental

    assert_not_nil note("c")
    assert_equal LetterName::C, note("c").name
    assert_equal Accidental::Neutral, note("c").accidental

    assert_not_nil note("c#")
    assert_equal LetterName::C, note("c#").name
    assert_equal Accidental::Sharp, note("c#").accidental

    assert_not_nil note("c##")
    assert_equal LetterName::C, note("c##").name
    assert_equal Accidental::DoubleSharp, note("c##").accidental

    assert_not_nil note("dbb")
    assert_equal LetterName::D, note("dbb").name
    assert_equal Accidental::DoubleFlat, note("dbb").accidental

    assert_not_nil note("db")
    assert_equal LetterName::D, note("db").name
    assert_equal Accidental::Flat, note("db").accidental

    assert_not_nil note("d")
    assert_equal LetterName::D, note("d").name
    assert_equal Accidental::Neutral, note("d").accidental

    assert_not_nil note("d#")
    assert_equal LetterName::D, note("d#").name
    assert_equal Accidental::Sharp, note("d#").accidental

    assert_not_nil note("d##")
    assert_equal LetterName::D, note("d##").name
    assert_equal Accidental::DoubleSharp, note("d##").accidental

    assert_not_nil note("ebb")
    assert_equal LetterName::E, note("ebb").name
    assert_equal Accidental::DoubleFlat, note("ebb").accidental

    assert_not_nil note("eb")
    assert_equal LetterName::E, note("eb").name
    assert_equal Accidental::Flat, note("eb").accidental

    assert_not_nil note("e")
    assert_equal LetterName::E, note("e").name
    assert_equal Accidental::Neutral, note("e").accidental

    assert_not_nil note("e#")
    assert_equal LetterName::E, note("e#").name
    assert_equal Accidental::Sharp, note("e#").accidental

    assert_not_nil note("e##")
    assert_equal LetterName::E, note("e##").name
    assert_equal Accidental::DoubleSharp, note("e##").accidental

    assert_not_nil note("fbb")
    assert_equal LetterName::F, note("fbb").name
    assert_equal Accidental::DoubleFlat, note("fbb").accidental

    assert_not_nil note("fb")
    assert_equal LetterName::F, note("fb").name
    assert_equal Accidental::Flat, note("fb").accidental

    assert_not_nil note("f")
    assert_equal LetterName::F, note("f").name
    assert_equal Accidental::Neutral, note("f").accidental

    assert_not_nil note("f#")
    assert_equal LetterName::F, note("f#").name
    assert_equal Accidental::Sharp, note("f#").accidental

    assert_not_nil note("f##")
    assert_equal LetterName::F, note("f##").name
    assert_equal Accidental::DoubleSharp, note("f##").accidental

    assert_not_nil note("gbb")
    assert_equal LetterName::G, note("gbb").name
    assert_equal Accidental::DoubleFlat, note("gbb").accidental

    assert_not_nil note("gb")
    assert_equal LetterName::G, note("gb").name
    assert_equal Accidental::Flat, note("gb").accidental

    assert_not_nil note("g")
    assert_equal LetterName::G, note("g").name
    assert_equal Accidental::Neutral, note("g").accidental

    assert_not_nil note("g#")
    assert_equal LetterName::G, note("g#").name
    assert_equal Accidental::Sharp, note("g#").accidental

    assert_not_nil note("g##")
    assert_equal LetterName::G, note("g##").name
    assert_equal Accidental::DoubleSharp, note("g##").accidental
  end

  test "deserialize works for invalid inputs" do
    assert_raises do
      note("")
    end

    assert_raises do
      assert_not note("i")
    end

    assert_raises do
      assert_not note("abcd")
    end

    assert_raises do
      assert_not note("a#b")
    end
  end

  test "serializeing and deserializing gets the same result" do
    LetterName.each_value do |name|
      Accidental.each_value do |accidental|
        note = Note.new(name, accidental)

        assert_equal note, note(note.serialize)
      end
    end
  end

  test "adding intervals works for Cb" do
    assert_equal note("cb"), note("cb").add(I::PerfectUnision)
    assert_equal note("c"), note("cb").add(I::AugmentedUnison)

    assert_equal note("dbbb"), note("cb").add(I::DiminishedSecond)
    assert_equal note("dbb"), note("cb").add(I::MinorSecond)
    assert_equal note("db"), note("cb").add(I::MajorSecond)
    assert_equal note("d"), note("cb").add(I::AugmentedSecond)

    assert_equal note("ebbb"), note("cb").add(I::DiminishedThird)
    assert_equal note("ebb"), note("cb").add(I::MinorThird)
    assert_equal note("eb"), note("cb").add(I::MajorThird)
    assert_equal note("e"), note("cb").add(I::AugmentedThird)

    assert_equal note("fbb"), note("cb").add(I::DiminishedFourth)
    assert_equal note("fb"), note("cb").add(I::PerfectFourth)
    assert_equal note("f"), note("cb").add(I::AugmentedFourth)

    assert_equal note("gbb"), note("cb").add(I::DiminishedFifth)
    assert_equal note("gb"), note("cb").add(I::PerfectFifth)
    assert_equal note("g"), note("cb").add(I::AugmentedFifth)

    assert_equal note("abbb"), note("cb").add(I::DiminishedSixth)
    assert_equal note("abb"), note("cb").add(I::MinorSixth)
    assert_equal note("ab"), note("cb").add(I::MajorSixth)
    assert_equal note("a"), note("cb").add(I::AugmentedSixth)

    assert_equal note("bbbb"), note("cb").add(I::DiminishedSeventh)
    assert_equal note("bbb"), note("cb").add(I::MinorSeventh)
    assert_equal note("bb"), note("cb").add(I::MajorSeventh)
    assert_equal note("b"), note("cb").add(I::AugmentedSeventh)

    assert_equal note("cb"), note("cb").add(I::PerfectOctave)
  end

  test "adding intervals works for C" do
    assert_equal note("c"), note("c").add(I::PerfectUnision)
    assert_equal note("c#"), note("c").add(I::AugmentedUnison)

    assert_equal note("dbb"), note("c").add(I::DiminishedSecond)
    assert_equal note("db"), note("c").add(I::MinorSecond)
    assert_equal note("d"), note("c").add(I::MajorSecond)
    assert_equal note("d#"), note("c").add(I::AugmentedSecond)

    assert_equal note("ebb"), note("c").add(I::DiminishedThird)
    assert_equal note("eb"), note("c").add(I::MinorThird)
    assert_equal note("e"), note("c").add(I::MajorThird)
    assert_equal note("e#"), note("c").add(I::AugmentedThird)

    assert_equal note("fb"), note("c").add(I::DiminishedFourth)
    assert_equal note("f"), note("c").add(I::PerfectFourth)
    assert_equal note("f#"), note("c").add(I::AugmentedFourth)

    assert_equal note("gb"), note("c").add(I::DiminishedFifth)
    assert_equal note("g"), note("c").add(I::PerfectFifth)
    assert_equal note("g#"), note("c").add(I::AugmentedFifth)

    assert_equal note("abb"), note("c").add(I::DiminishedSixth)
    assert_equal note("ab"), note("c").add(I::MinorSixth)
    assert_equal note("a"), note("c").add(I::MajorSixth)
    assert_equal note("a#"), note("c").add(I::AugmentedSixth)

    assert_equal note("bbb"), note("c").add(I::DiminishedSeventh)
    assert_equal note("bb"), note("c").add(I::MinorSeventh)
    assert_equal note("b"), note("c").add(I::MajorSeventh)
    assert_equal note("b#"), note("c").add(I::AugmentedSeventh)

    assert_equal note("c"), note("c").add(I::PerfectOctave)
  end

  test "adding intervals works for C#" do
    assert_equal note("c#"), note("c#").add(I::PerfectUnision)
    assert_equal note("c##"), note("c#").add(I::AugmentedUnison)

    assert_equal note("db"), note("c#").add(I::DiminishedSecond)
    assert_equal note("d"), note("c#").add(I::MinorSecond)
    assert_equal note("d#"), note("c#").add(I::MajorSecond)
    assert_equal note("d##"), note("c#").add(I::AugmentedSecond)

    assert_equal note("eb"), note("c#").add(I::DiminishedThird)
    assert_equal note("e"), note("c#").add(I::MinorThird)
    assert_equal note("e#"), note("c#").add(I::MajorThird)
    assert_equal note("e##"), note("c#").add(I::AugmentedThird)

    assert_equal note("f"), note("c#").add(I::DiminishedFourth)
    assert_equal note("f#"), note("c#").add(I::PerfectFourth)
    assert_equal note("f##"), note("c#").add(I::AugmentedFourth)

    assert_equal note("g"), note("c#").add(I::DiminishedFifth)
    assert_equal note("g#"), note("c#").add(I::PerfectFifth)
    assert_equal note("g##"), note("c#").add(I::AugmentedFifth)

    assert_equal note("ab"), note("c#").add(I::DiminishedSixth)
    assert_equal note("a"), note("c#").add(I::MinorSixth)
    assert_equal note("a#"), note("c#").add(I::MajorSixth)
    assert_equal note("a##"), note("c#").add(I::AugmentedSixth)

    assert_equal note("bb"), note("c#").add(I::DiminishedSeventh)
    assert_equal note("b"), note("c#").add(I::MinorSeventh)
    assert_equal note("b#"), note("c#").add(I::MajorSeventh)
    assert_equal note("b##"), note("c#").add(I::AugmentedSeventh)

    assert_equal note("c#"), note("c#").add(I::PerfectOctave)
  end
end
