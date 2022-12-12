# typed: strict
# frozen_string_literal: true

require "test_helper"

class NoteTest < ActiveSupport::TestCase
  extend T::Sig

  test "deserialize works for valid inputs" do
    assert Note.deserialize("a♭♭").value?
    assert_equal LetterName::A, Note.deserialize("a♭♭").value!.name
    assert_equal Accidental::DoubleFlat, Note.deserialize("a♭♭").value!.accidental

    assert Note.deserialize("a♭").value?
    assert_equal LetterName::A, Note.deserialize("a♭").value!.name
    assert_equal Accidental::Flat, Note.deserialize("a♭").value!.accidental

    assert Note.deserialize("a").value?
    assert_equal LetterName::A, Note.deserialize("a").value!.name
    assert_equal Accidental::Neutral, Note.deserialize("a").value!.accidental

    assert Note.deserialize("a♯").value?
    assert_equal LetterName::A, Note.deserialize("a♯").value!.name
    assert_equal Accidental::Sharp, Note.deserialize("a♯").value!.accidental

    assert Note.deserialize("a♯♯").value?
    assert_equal LetterName::A, Note.deserialize("a♯♯").value!.name
    assert_equal Accidental::DoubleSharp, Note.deserialize("a♯♯").value!.accidental

    assert Note.deserialize("b♭♭").value?
    assert_equal LetterName::B, Note.deserialize("b♭♭").value!.name
    assert_equal Accidental::DoubleFlat, Note.deserialize("b♭♭").value!.accidental

    assert Note.deserialize("b♭").value?
    assert_equal LetterName::B, Note.deserialize("b♭").value!.name
    assert_equal Accidental::Flat, Note.deserialize("b♭").value!.accidental

    assert Note.deserialize("b").value?
    assert_equal LetterName::B, Note.deserialize("b").value!.name
    assert_equal Accidental::Neutral, Note.deserialize("b").value!.accidental

    assert Note.deserialize("b♯").value?
    assert_equal LetterName::B, Note.deserialize("b♯").value!.name
    assert_equal Accidental::Sharp, Note.deserialize("b♯").value!.accidental

    assert Note.deserialize("b♯♯").value?
    assert_equal LetterName::B, Note.deserialize("b♯♯").value!.name
    assert_equal Accidental::DoubleSharp, Note.deserialize("b♯♯").value!.accidental

    assert Note.deserialize("c♭♭").value?
    assert_equal LetterName::C, Note.deserialize("c♭♭").value!.name
    assert_equal Accidental::DoubleFlat, Note.deserialize("c♭♭").value!.accidental

    assert Note.deserialize("c♭").value?
    assert_equal LetterName::C, Note.deserialize("c♭").value!.name
    assert_equal Accidental::Flat, Note.deserialize("c♭").value!.accidental

    assert Note.deserialize("c").value?
    assert_equal LetterName::C, Note.deserialize("c").value!.name
    assert_equal Accidental::Neutral, Note.deserialize("c").value!.accidental

    assert Note.deserialize("c♯").value?
    assert_equal LetterName::C, Note.deserialize("c♯").value!.name
    assert_equal Accidental::Sharp, Note.deserialize("c♯").value!.accidental

    assert Note.deserialize("c♯♯").value?
    assert_equal LetterName::C, Note.deserialize("c♯♯").value!.name
    assert_equal Accidental::DoubleSharp, Note.deserialize("c♯♯").value!.accidental

    assert Note.deserialize("d♭♭").value?
    assert_equal LetterName::D, Note.deserialize("d♭♭").value!.name
    assert_equal Accidental::DoubleFlat, Note.deserialize("d♭♭").value!.accidental

    assert Note.deserialize("d♭").value?
    assert_equal LetterName::D, Note.deserialize("d♭").value!.name
    assert_equal Accidental::Flat, Note.deserialize("d♭").value!.accidental

    assert Note.deserialize("d").value?
    assert_equal LetterName::D, Note.deserialize("d").value!.name
    assert_equal Accidental::Neutral, Note.deserialize("d").value!.accidental

    assert Note.deserialize("d♯").value?
    assert_equal LetterName::D, Note.deserialize("d♯").value!.name
    assert_equal Accidental::Sharp, Note.deserialize("d♯").value!.accidental

    assert Note.deserialize("d♯♯").value?
    assert_equal LetterName::D, Note.deserialize("d♯♯").value!.name
    assert_equal Accidental::DoubleSharp, Note.deserialize("d♯♯").value!.accidental

    assert Note.deserialize("e♭♭").value?
    assert_equal LetterName::E, Note.deserialize("e♭♭").value!.name
    assert_equal Accidental::DoubleFlat, Note.deserialize("e♭♭").value!.accidental

    assert Note.deserialize("e♭").value?
    assert_equal LetterName::E, Note.deserialize("e♭").value!.name
    assert_equal Accidental::Flat, Note.deserialize("e♭").value!.accidental

    assert Note.deserialize("e").value?
    assert_equal LetterName::E, Note.deserialize("e").value!.name
    assert_equal Accidental::Neutral, Note.deserialize("e").value!.accidental

    assert Note.deserialize("e♯").value?
    assert_equal LetterName::E, Note.deserialize("e♯").value!.name
    assert_equal Accidental::Sharp, Note.deserialize("e♯").value!.accidental

    assert Note.deserialize("e♯♯").value?
    assert_equal LetterName::E, Note.deserialize("e♯♯").value!.name
    assert_equal Accidental::DoubleSharp, Note.deserialize("e♯♯").value!.accidental

    assert Note.deserialize("f♭♭").value?
    assert_equal LetterName::F, Note.deserialize("f♭♭").value!.name
    assert_equal Accidental::DoubleFlat, Note.deserialize("f♭♭").value!.accidental

    assert Note.deserialize("f♭").value?
    assert_equal LetterName::F, Note.deserialize("f♭").value!.name
    assert_equal Accidental::Flat, Note.deserialize("f♭").value!.accidental

    assert Note.deserialize("f").value?
    assert_equal LetterName::F, Note.deserialize("f").value!.name
    assert_equal Accidental::Neutral, Note.deserialize("f").value!.accidental

    assert Note.deserialize("f♯").value?
    assert_equal LetterName::F, Note.deserialize("f♯").value!.name
    assert_equal Accidental::Sharp, Note.deserialize("f♯").value!.accidental

    assert Note.deserialize("f♯♯").value?
    assert_equal LetterName::F, Note.deserialize("f♯♯").value!.name
    assert_equal Accidental::DoubleSharp, Note.deserialize("f♯♯").value!.accidental

    assert Note.deserialize("g♭♭").value?
    assert_equal LetterName::G, Note.deserialize("g♭♭").value!.name
    assert_equal Accidental::DoubleFlat, Note.deserialize("g♭♭").value!.accidental

    assert Note.deserialize("g♭").value?
    assert_equal LetterName::G, Note.deserialize("g♭").value!.name
    assert_equal Accidental::Flat, Note.deserialize("g♭").value!.accidental

    assert Note.deserialize("g").value?
    assert_equal LetterName::G, Note.deserialize("g").value!.name
    assert_equal Accidental::Neutral, Note.deserialize("g").value!.accidental

    assert Note.deserialize("g♯").value?
    assert_equal LetterName::G, Note.deserialize("g♯").value!.name
    assert_equal Accidental::Sharp, Note.deserialize("g♯").value!.accidental

    assert Note.deserialize("g♯♯").value?
    assert_equal LetterName::G, Note.deserialize("g♯♯").value!.name
    assert_equal Accidental::DoubleSharp, Note.deserialize("g♯♯").value!.accidental
  end

  test "deserialize works for invalid inputs" do
    assert_not Note.deserialize("").value?
    assert_not Note.deserialize("i").value?
    assert_not Note.deserialize("abcd").value?
    assert_not Note.deserialize("a♯♭").value?
  end

  test "serializeing and deserializing gets the same result" do
    LetterName.each_value do |name|
      Accidental.each_value do |accidental|
        note = Note.new(name, accidental)

        assert_equal note, Note.deserialize(note.serialize).value!
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
    Note.deserialize(input).value!
  end
end
