# typed: strict
# frozen_string_literal: true

require "test_helper"

class NoteTest < ActiveSupport::TestCase
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
end
