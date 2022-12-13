# typed: strict
# frozen_string_literal: true

require "test_helper"

class NoteTest < ActiveSupport::TestCase
  extend T::Sig

  test "deserialize works for valid inputs" do
    assert_not_nil note("a♭♭")
    assert_equal LetterName::A, note("a♭♭").name
    assert_equal Accidental::DoubleFlat, note("a♭♭").accidental

    assert_not_nil note("a♭")
    assert_equal LetterName::A, note("a♭").name
    assert_equal Accidental::Flat, note("a♭").accidental

    assert_not_nil note("a")
    assert_equal LetterName::A, note("a").name
    assert_equal Accidental::Neutral, note("a").accidental

    assert_not_nil note("a♯")
    assert_equal LetterName::A, note("a♯").name
    assert_equal Accidental::Sharp, note("a♯").accidental

    assert_not_nil note("a♯♯")
    assert_equal LetterName::A, note("a♯♯").name
    assert_equal Accidental::DoubleSharp, note("a♯♯").accidental

    assert_not_nil note("b♭♭")
    assert_equal LetterName::B, note("b♭♭").name
    assert_equal Accidental::DoubleFlat, note("b♭♭").accidental

    assert_not_nil note("b♭")
    assert_equal LetterName::B, note("b♭").name
    assert_equal Accidental::Flat, note("b♭").accidental

    assert_not_nil note("b")
    assert_equal LetterName::B, note("b").name
    assert_equal Accidental::Neutral, note("b").accidental

    assert_not_nil note("b♯")
    assert_equal LetterName::B, note("b♯").name
    assert_equal Accidental::Sharp, note("b♯").accidental

    assert_not_nil note("b♯♯")
    assert_equal LetterName::B, note("b♯♯").name
    assert_equal Accidental::DoubleSharp, note("b♯♯").accidental

    assert_not_nil note("c♭♭")
    assert_equal LetterName::C, note("c♭♭").name
    assert_equal Accidental::DoubleFlat, note("c♭♭").accidental

    assert_not_nil note("c♭")
    assert_equal LetterName::C, note("c♭").name
    assert_equal Accidental::Flat, note("c♭").accidental

    assert_not_nil note("c")
    assert_equal LetterName::C, note("c").name
    assert_equal Accidental::Neutral, note("c").accidental

    assert_not_nil note("c♯")
    assert_equal LetterName::C, note("c♯").name
    assert_equal Accidental::Sharp, note("c♯").accidental

    assert_not_nil note("c♯♯")
    assert_equal LetterName::C, note("c♯♯").name
    assert_equal Accidental::DoubleSharp, note("c♯♯").accidental

    assert_not_nil note("d♭♭")
    assert_equal LetterName::D, note("d♭♭").name
    assert_equal Accidental::DoubleFlat, note("d♭♭").accidental

    assert_not_nil note("d♭")
    assert_equal LetterName::D, note("d♭").name
    assert_equal Accidental::Flat, note("d♭").accidental

    assert_not_nil note("d")
    assert_equal LetterName::D, note("d").name
    assert_equal Accidental::Neutral, note("d").accidental

    assert_not_nil note("d♯")
    assert_equal LetterName::D, note("d♯").name
    assert_equal Accidental::Sharp, note("d♯").accidental

    assert_not_nil note("d♯♯")
    assert_equal LetterName::D, note("d♯♯").name
    assert_equal Accidental::DoubleSharp, note("d♯♯").accidental

    assert_not_nil note("e♭♭")
    assert_equal LetterName::E, note("e♭♭").name
    assert_equal Accidental::DoubleFlat, note("e♭♭").accidental

    assert_not_nil note("e♭")
    assert_equal LetterName::E, note("e♭").name
    assert_equal Accidental::Flat, note("e♭").accidental

    assert_not_nil note("e")
    assert_equal LetterName::E, note("e").name
    assert_equal Accidental::Neutral, note("e").accidental

    assert_not_nil note("e♯")
    assert_equal LetterName::E, note("e♯").name
    assert_equal Accidental::Sharp, note("e♯").accidental

    assert_not_nil note("e♯♯")
    assert_equal LetterName::E, note("e♯♯").name
    assert_equal Accidental::DoubleSharp, note("e♯♯").accidental

    assert_not_nil note("f♭♭")
    assert_equal LetterName::F, note("f♭♭").name
    assert_equal Accidental::DoubleFlat, note("f♭♭").accidental

    assert_not_nil note("f♭")
    assert_equal LetterName::F, note("f♭").name
    assert_equal Accidental::Flat, note("f♭").accidental

    assert_not_nil note("f")
    assert_equal LetterName::F, note("f").name
    assert_equal Accidental::Neutral, note("f").accidental

    assert_not_nil note("f♯")
    assert_equal LetterName::F, note("f♯").name
    assert_equal Accidental::Sharp, note("f♯").accidental

    assert_not_nil note("f♯♯")
    assert_equal LetterName::F, note("f♯♯").name
    assert_equal Accidental::DoubleSharp, note("f♯♯").accidental

    assert_not_nil note("g♭♭")
    assert_equal LetterName::G, note("g♭♭").name
    assert_equal Accidental::DoubleFlat, note("g♭♭").accidental

    assert_not_nil note("g♭")
    assert_equal LetterName::G, note("g♭").name
    assert_equal Accidental::Flat, note("g♭").accidental

    assert_not_nil note("g")
    assert_equal LetterName::G, note("g").name
    assert_equal Accidental::Neutral, note("g").accidental

    assert_not_nil note("g♯")
    assert_equal LetterName::G, note("g♯").name
    assert_equal Accidental::Sharp, note("g♯").accidental

    assert_not_nil note("g♯♯")
    assert_equal LetterName::G, note("g♯♯").name
    assert_equal Accidental::DoubleSharp, note("g♯♯").accidental
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
      assert_not note("a♯♭")
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

  test "adding intervals works for C♭" do
    assert_equal note("c♭"), note("c♭").add(I::PerfectUnision)
    assert_equal note("c"), note("c♭").add(I::AugmentedUnison)

    assert_equal note("d♭♭♭"), note("c♭").add(I::DiminishedSecond)
    assert_equal note("d♭♭"), note("c♭").add(I::MinorSecond)
    assert_equal note("d♭"), note("c♭").add(I::MajorSecond)
    assert_equal note("d"), note("c♭").add(I::AugmentedSecond)

    assert_equal note("e♭♭♭"), note("c♭").add(I::DiminishedThird)
    assert_equal note("e♭♭"), note("c♭").add(I::MinorThird)
    assert_equal note("e♭"), note("c♭").add(I::MajorThird)
    assert_equal note("e"), note("c♭").add(I::AugmentedThird)

    assert_equal note("f♭♭"), note("c♭").add(I::DiminishedFourth)
    assert_equal note("f♭"), note("c♭").add(I::PerfectFourth)
    assert_equal note("f"), note("c♭").add(I::AugmentedFourth)

    assert_equal note("g♭♭"), note("c♭").add(I::DiminishedFifth)
    assert_equal note("g♭"), note("c♭").add(I::PerfectFifth)
    assert_equal note("g"), note("c♭").add(I::AugmentedFifth)

    assert_equal note("a♭♭♭"), note("c♭").add(I::DiminishedSixth)
    assert_equal note("a♭♭"), note("c♭").add(I::MinorSixth)
    assert_equal note("a♭"), note("c♭").add(I::MajorSixth)
    assert_equal note("a"), note("c♭").add(I::AugmentedSixth)

    assert_equal note("b♭♭♭"), note("c♭").add(I::DiminishedSeventh)
    assert_equal note("b♭♭"), note("c♭").add(I::MinorSeventh)
    assert_equal note("b♭"), note("c♭").add(I::MajorSeventh)
    assert_equal note("b"), note("c♭").add(I::AugmentedSeventh)

    assert_equal note("c♭"), note("c♭").add(I::PerfectOctave)
  end

  test "adding intervals works for C" do
    assert_equal note("c"), note("c").add(I::PerfectUnision)
    assert_equal note("c♯"), note("c").add(I::AugmentedUnison)

    assert_equal note("d♭♭"), note("c").add(I::DiminishedSecond)
    assert_equal note("d♭"), note("c").add(I::MinorSecond)
    assert_equal note("d"), note("c").add(I::MajorSecond)
    assert_equal note("d♯"), note("c").add(I::AugmentedSecond)

    assert_equal note("e♭♭"), note("c").add(I::DiminishedThird)
    assert_equal note("e♭"), note("c").add(I::MinorThird)
    assert_equal note("e"), note("c").add(I::MajorThird)
    assert_equal note("e♯"), note("c").add(I::AugmentedThird)

    assert_equal note("f♭"), note("c").add(I::DiminishedFourth)
    assert_equal note("f"), note("c").add(I::PerfectFourth)
    assert_equal note("f♯"), note("c").add(I::AugmentedFourth)

    assert_equal note("g♭"), note("c").add(I::DiminishedFifth)
    assert_equal note("g"), note("c").add(I::PerfectFifth)
    assert_equal note("g♯"), note("c").add(I::AugmentedFifth)

    assert_equal note("a♭♭"), note("c").add(I::DiminishedSixth)
    assert_equal note("a♭"), note("c").add(I::MinorSixth)
    assert_equal note("a"), note("c").add(I::MajorSixth)
    assert_equal note("a♯"), note("c").add(I::AugmentedSixth)

    assert_equal note("b♭♭"), note("c").add(I::DiminishedSeventh)
    assert_equal note("b♭"), note("c").add(I::MinorSeventh)
    assert_equal note("b"), note("c").add(I::MajorSeventh)
    assert_equal note("b♯"), note("c").add(I::AugmentedSeventh)

    assert_equal note("c"), note("c").add(I::PerfectOctave)
  end

  test "adding intervals works for C♯" do
    assert_equal note("c♯"), note("c♯").add(I::PerfectUnision)
    assert_equal note("c♯♯"), note("c♯").add(I::AugmentedUnison)

    assert_equal note("d♭"), note("c♯").add(I::DiminishedSecond)
    assert_equal note("d"), note("c♯").add(I::MinorSecond)
    assert_equal note("d♯"), note("c♯").add(I::MajorSecond)
    assert_equal note("d♯♯"), note("c♯").add(I::AugmentedSecond)

    assert_equal note("e♭"), note("c♯").add(I::DiminishedThird)
    assert_equal note("e"), note("c♯").add(I::MinorThird)
    assert_equal note("e♯"), note("c♯").add(I::MajorThird)
    assert_equal note("e♯♯"), note("c♯").add(I::AugmentedThird)

    assert_equal note("f"), note("c♯").add(I::DiminishedFourth)
    assert_equal note("f♯"), note("c♯").add(I::PerfectFourth)
    assert_equal note("f♯♯"), note("c♯").add(I::AugmentedFourth)

    assert_equal note("g"), note("c♯").add(I::DiminishedFifth)
    assert_equal note("g♯"), note("c♯").add(I::PerfectFifth)
    assert_equal note("g♯♯"), note("c♯").add(I::AugmentedFifth)

    assert_equal note("a♭"), note("c♯").add(I::DiminishedSixth)
    assert_equal note("a"), note("c♯").add(I::MinorSixth)
    assert_equal note("a♯"), note("c♯").add(I::MajorSixth)
    assert_equal note("a♯♯"), note("c♯").add(I::AugmentedSixth)

    assert_equal note("b♭"), note("c♯").add(I::DiminishedSeventh)
    assert_equal note("b"), note("c♯").add(I::MinorSeventh)
    assert_equal note("b♯"), note("c♯").add(I::MajorSeventh)
    assert_equal note("b♯♯"), note("c♯").add(I::AugmentedSeventh)

    assert_equal note("c♯"), note("c♯").add(I::PerfectOctave)
  end
end
