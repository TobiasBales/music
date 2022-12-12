# typed: strict
# frozen_string_literal: true

require "test_helper"

class NoteTest < ActiveSupport::TestCase
  extend T::Sig

  test "deserialize works for valid inputs" do
    assert_not_nil Note.deserialize("a♭♭")
    assert_equal LetterName::A, Note.deserialize("a♭♭").name
    assert_equal Accidental::DoubleFlat, Note.deserialize("a♭♭").accidental

    assert_not_nil Note.deserialize("a♭")
    assert_equal LetterName::A, Note.deserialize("a♭").name
    assert_equal Accidental::Flat, Note.deserialize("a♭").accidental

    assert_not_nil Note.deserialize("a")
    assert_equal LetterName::A, Note.deserialize("a").name
    assert_equal Accidental::Neutral, Note.deserialize("a").accidental

    assert_not_nil Note.deserialize("a♯")
    assert_equal LetterName::A, Note.deserialize("a♯").name
    assert_equal Accidental::Sharp, Note.deserialize("a♯").accidental

    assert_not_nil Note.deserialize("a♯♯")
    assert_equal LetterName::A, Note.deserialize("a♯♯").name
    assert_equal Accidental::DoubleSharp, Note.deserialize("a♯♯").accidental

    assert_not_nil Note.deserialize("b♭♭")
    assert_equal LetterName::B, Note.deserialize("b♭♭").name
    assert_equal Accidental::DoubleFlat, Note.deserialize("b♭♭").accidental

    assert_not_nil Note.deserialize("b♭")
    assert_equal LetterName::B, Note.deserialize("b♭").name
    assert_equal Accidental::Flat, Note.deserialize("b♭").accidental

    assert_not_nil Note.deserialize("b")
    assert_equal LetterName::B, Note.deserialize("b").name
    assert_equal Accidental::Neutral, Note.deserialize("b").accidental

    assert_not_nil Note.deserialize("b♯")
    assert_equal LetterName::B, Note.deserialize("b♯").name
    assert_equal Accidental::Sharp, Note.deserialize("b♯").accidental

    assert_not_nil Note.deserialize("b♯♯")
    assert_equal LetterName::B, Note.deserialize("b♯♯").name
    assert_equal Accidental::DoubleSharp, Note.deserialize("b♯♯").accidental

    assert_not_nil Note.deserialize("c♭♭")
    assert_equal LetterName::C, Note.deserialize("c♭♭").name
    assert_equal Accidental::DoubleFlat, Note.deserialize("c♭♭").accidental

    assert_not_nil Note.deserialize("c♭")
    assert_equal LetterName::C, Note.deserialize("c♭").name
    assert_equal Accidental::Flat, Note.deserialize("c♭").accidental

    assert_not_nil Note.deserialize("c")
    assert_equal LetterName::C, Note.deserialize("c").name
    assert_equal Accidental::Neutral, Note.deserialize("c").accidental

    assert_not_nil Note.deserialize("c♯")
    assert_equal LetterName::C, Note.deserialize("c♯").name
    assert_equal Accidental::Sharp, Note.deserialize("c♯").accidental

    assert_not_nil Note.deserialize("c♯♯")
    assert_equal LetterName::C, Note.deserialize("c♯♯").name
    assert_equal Accidental::DoubleSharp, Note.deserialize("c♯♯").accidental

    assert_not_nil Note.deserialize("d♭♭")
    assert_equal LetterName::D, Note.deserialize("d♭♭").name
    assert_equal Accidental::DoubleFlat, Note.deserialize("d♭♭").accidental

    assert_not_nil Note.deserialize("d♭")
    assert_equal LetterName::D, Note.deserialize("d♭").name
    assert_equal Accidental::Flat, Note.deserialize("d♭").accidental

    assert_not_nil Note.deserialize("d")
    assert_equal LetterName::D, Note.deserialize("d").name
    assert_equal Accidental::Neutral, Note.deserialize("d").accidental

    assert_not_nil Note.deserialize("d♯")
    assert_equal LetterName::D, Note.deserialize("d♯").name
    assert_equal Accidental::Sharp, Note.deserialize("d♯").accidental

    assert_not_nil Note.deserialize("d♯♯")
    assert_equal LetterName::D, Note.deserialize("d♯♯").name
    assert_equal Accidental::DoubleSharp, Note.deserialize("d♯♯").accidental

    assert_not_nil Note.deserialize("e♭♭")
    assert_equal LetterName::E, Note.deserialize("e♭♭").name
    assert_equal Accidental::DoubleFlat, Note.deserialize("e♭♭").accidental

    assert_not_nil Note.deserialize("e♭")
    assert_equal LetterName::E, Note.deserialize("e♭").name
    assert_equal Accidental::Flat, Note.deserialize("e♭").accidental

    assert_not_nil Note.deserialize("e")
    assert_equal LetterName::E, Note.deserialize("e").name
    assert_equal Accidental::Neutral, Note.deserialize("e").accidental

    assert_not_nil Note.deserialize("e♯")
    assert_equal LetterName::E, Note.deserialize("e♯").name
    assert_equal Accidental::Sharp, Note.deserialize("e♯").accidental

    assert_not_nil Note.deserialize("e♯♯")
    assert_equal LetterName::E, Note.deserialize("e♯♯").name
    assert_equal Accidental::DoubleSharp, Note.deserialize("e♯♯").accidental

    assert_not_nil Note.deserialize("f♭♭")
    assert_equal LetterName::F, Note.deserialize("f♭♭").name
    assert_equal Accidental::DoubleFlat, Note.deserialize("f♭♭").accidental

    assert_not_nil Note.deserialize("f♭")
    assert_equal LetterName::F, Note.deserialize("f♭").name
    assert_equal Accidental::Flat, Note.deserialize("f♭").accidental

    assert_not_nil Note.deserialize("f")
    assert_equal LetterName::F, Note.deserialize("f").name
    assert_equal Accidental::Neutral, Note.deserialize("f").accidental

    assert_not_nil Note.deserialize("f♯")
    assert_equal LetterName::F, Note.deserialize("f♯").name
    assert_equal Accidental::Sharp, Note.deserialize("f♯").accidental

    assert_not_nil Note.deserialize("f♯♯")
    assert_equal LetterName::F, Note.deserialize("f♯♯").name
    assert_equal Accidental::DoubleSharp, Note.deserialize("f♯♯").accidental

    assert_not_nil Note.deserialize("g♭♭")
    assert_equal LetterName::G, Note.deserialize("g♭♭").name
    assert_equal Accidental::DoubleFlat, Note.deserialize("g♭♭").accidental

    assert_not_nil Note.deserialize("g♭")
    assert_equal LetterName::G, Note.deserialize("g♭").name
    assert_equal Accidental::Flat, Note.deserialize("g♭").accidental

    assert_not_nil Note.deserialize("g")
    assert_equal LetterName::G, Note.deserialize("g").name
    assert_equal Accidental::Neutral, Note.deserialize("g").accidental

    assert_not_nil Note.deserialize("g♯")
    assert_equal LetterName::G, Note.deserialize("g♯").name
    assert_equal Accidental::Sharp, Note.deserialize("g♯").accidental

    assert_not_nil Note.deserialize("g♯♯")
    assert_equal LetterName::G, Note.deserialize("g♯♯").name
    assert_equal Accidental::DoubleSharp, Note.deserialize("g♯♯").accidental
  end

  test "deserialize works for invalid inputs" do
    assert_raises do
      Note.deserialize("")
    end

    assert_raises do
      assert_not Note.deserialize("i")
    end

    assert_raises do
      assert_not Note.deserialize("abcd")
    end

    assert_raises do
      assert_not Note.deserialize("a♯♭")
    end
  end

  test "serializeing and deserializing gets the same result" do
    LetterName.each_value do |name|
      Accidental.each_value do |accidental|
        note = Note.new(name, accidental)

        assert_equal note, Note.deserialize(note.serialize)
      end
    end
  end

  test "adding intervals works for C♭" do
    assert_equal note("c♭"), note("c♭").add(Interval::PerfectUnision)
    assert_equal note("c"), note("c♭").add(Interval::AugmentedUnison)

    assert_equal note("d♭♭♭"), note("c♭").add(Interval::DiminishedSecond)
    assert_equal note("d♭♭"), note("c♭").add(Interval::MinorSecond)
    assert_equal note("d♭"), note("c♭").add(Interval::MajorSecond)
    assert_equal note("d"), note("c♭").add(Interval::AugmentedSecond)

    assert_equal note("e♭♭♭"), note("c♭").add(Interval::DiminishedThird)
    assert_equal note("e♭♭"), note("c♭").add(Interval::MinorThird)
    assert_equal note("e♭"), note("c♭").add(Interval::MajorThird)
    assert_equal note("e"), note("c♭").add(Interval::AugmentedThird)

    assert_equal note("f♭♭"), note("c♭").add(Interval::DiminishedFourth)
    assert_equal note("f♭"), note("c♭").add(Interval::PerfectFourth)
    assert_equal note("f"), note("c♭").add(Interval::AugmentedFourth)

    assert_equal note("g♭♭"), note("c♭").add(Interval::DiminishedFifth)
    assert_equal note("g♭"), note("c♭").add(Interval::PerfectFifth)
    assert_equal note("g"), note("c♭").add(Interval::AugmentedFifth)

    assert_equal note("a♭♭♭"), note("c♭").add(Interval::DiminishedSixth)
    assert_equal note("a♭♭"), note("c♭").add(Interval::MinorSixth)
    assert_equal note("a♭"), note("c♭").add(Interval::MajorSixth)
    assert_equal note("a"), note("c♭").add(Interval::AugmentedSixth)

    assert_equal note("b♭♭♭"), note("c♭").add(Interval::DiminishedSeventh)
    assert_equal note("b♭♭"), note("c♭").add(Interval::MinorSeventh)
    assert_equal note("b♭"), note("c♭").add(Interval::MajorSeventh)
    assert_equal note("b"), note("c♭").add(Interval::AugmentedSeventh)

    assert_equal note("c♭"), note("c♭").add(Interval::PerfectOctave)
  end

  test "adding intervals works for C" do
    assert_equal note("c"), note("c").add(Interval::PerfectUnision)
    assert_equal note("c♯"), note("c").add(Interval::AugmentedUnison)

    assert_equal note("d♭♭"), note("c").add(Interval::DiminishedSecond)
    assert_equal note("d♭"), note("c").add(Interval::MinorSecond)
    assert_equal note("d"), note("c").add(Interval::MajorSecond)
    assert_equal note("d♯"), note("c").add(Interval::AugmentedSecond)

    assert_equal note("e♭♭"), note("c").add(Interval::DiminishedThird)
    assert_equal note("e♭"), note("c").add(Interval::MinorThird)
    assert_equal note("e"), note("c").add(Interval::MajorThird)
    assert_equal note("e♯"), note("c").add(Interval::AugmentedThird)

    assert_equal note("f♭"), note("c").add(Interval::DiminishedFourth)
    assert_equal note("f"), note("c").add(Interval::PerfectFourth)
    assert_equal note("f♯"), note("c").add(Interval::AugmentedFourth)

    assert_equal note("g♭"), note("c").add(Interval::DiminishedFifth)
    assert_equal note("g"), note("c").add(Interval::PerfectFifth)
    assert_equal note("g♯"), note("c").add(Interval::AugmentedFifth)

    assert_equal note("a♭♭"), note("c").add(Interval::DiminishedSixth)
    assert_equal note("a♭"), note("c").add(Interval::MinorSixth)
    assert_equal note("a"), note("c").add(Interval::MajorSixth)
    assert_equal note("a♯"), note("c").add(Interval::AugmentedSixth)

    assert_equal note("b♭♭"), note("c").add(Interval::DiminishedSeventh)
    assert_equal note("b♭"), note("c").add(Interval::MinorSeventh)
    assert_equal note("b"), note("c").add(Interval::MajorSeventh)
    assert_equal note("b♯"), note("c").add(Interval::AugmentedSeventh)

    assert_equal note("c"), note("c").add(Interval::PerfectOctave)
  end

  test "adding intervals works for C♯" do
    assert_equal note("c♯"), note("c♯").add(Interval::PerfectUnision)
    assert_equal note("c♯♯"), note("c♯").add(Interval::AugmentedUnison)

    assert_equal note("d♭"), note("c♯").add(Interval::DiminishedSecond)
    assert_equal note("d"), note("c♯").add(Interval::MinorSecond)
    assert_equal note("d♯"), note("c♯").add(Interval::MajorSecond)
    assert_equal note("d♯♯"), note("c♯").add(Interval::AugmentedSecond)

    assert_equal note("e♭"), note("c♯").add(Interval::DiminishedThird)
    assert_equal note("e"), note("c♯").add(Interval::MinorThird)
    assert_equal note("e♯"), note("c♯").add(Interval::MajorThird)
    assert_equal note("e♯♯"), note("c♯").add(Interval::AugmentedThird)

    assert_equal note("f"), note("c♯").add(Interval::DiminishedFourth)
    assert_equal note("f♯"), note("c♯").add(Interval::PerfectFourth)
    assert_equal note("f♯♯"), note("c♯").add(Interval::AugmentedFourth)

    assert_equal note("g"), note("c♯").add(Interval::DiminishedFifth)
    assert_equal note("g♯"), note("c♯").add(Interval::PerfectFifth)
    assert_equal note("g♯♯"), note("c♯").add(Interval::AugmentedFifth)

    assert_equal note("a♭"), note("c♯").add(Interval::DiminishedSixth)
    assert_equal note("a"), note("c♯").add(Interval::MinorSixth)
    assert_equal note("a♯"), note("c♯").add(Interval::MajorSixth)
    assert_equal note("a♯♯"), note("c♯").add(Interval::AugmentedSixth)

    assert_equal note("b♭"), note("c♯").add(Interval::DiminishedSeventh)
    assert_equal note("b"), note("c♯").add(Interval::MinorSeventh)
    assert_equal note("b♯"), note("c♯").add(Interval::MajorSeventh)
    assert_equal note("b♯♯"), note("c♯").add(Interval::AugmentedSeventh)

    assert_equal note("c♯"), note("c♯").add(Interval::PerfectOctave)
  end

  private

  sig { params(input: String).returns(Note) }
  def note(input)
    Note.deserialize(input)
  end
end
