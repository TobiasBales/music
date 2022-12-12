# typed: strict
# frozen_string_literal: true

require "test_helper"

class ChordTest < ActiveSupport::TestCase
  test "C" do
    assert_equal [note("c"), note("e"), note("g")], Chord::Major.for_root(Note.deserialize("c"))
  end

  test "c" do
    assert_equal [note("c"), note("e♭"), note("g")], Chord::Minor.for_root(Note.deserialize("c"))
  end

  test "Co" do
    assert_equal [note("c"), note("e♭"), note("g♭")], Chord::Diminished.for_root(Note.deserialize("c"))
  end

  test "C+" do
    assert_equal [note("c"), note("e"), note("g♯")], Chord::Augmented.for_root(Note.deserialize("c"))
  end

  test "CΔ" do
    assert_equal [note("c"), note("e"), note("g"), note("b")], Chord::MajorSeventh.for_root(Note.deserialize("c"))
  end

  test "C−7" do
    assert_equal [note("c"), note("e♭"), note("g"), note("b♭")], Chord::MinorSeventh.for_root(Note.deserialize("c"))
  end

  test "C7" do
    assert_equal [note("c"), note("e"), note("g"), note("b♭")], Chord::DominantSeventh.for_root(Note.deserialize("c"))
  end

  test "Cø7" do
    assert_equal [note("c"), note("e♭"), note("g♭"), note("b♭")],
                 Chord::HalfDiminishedSeventh.for_root(Note.deserialize("c"))
  end

  test "Co7" do
    assert_equal [note("c"), note("e♭"), note("g♭"), note("b♭♭")],
                 Chord::DiminishedSeventh.for_root(Note.deserialize("c"))
  end

  test "C−Δ7" do
    assert_equal [note("c"), note("e♭"), note("g"), note("b")],
                 Chord::MinorMajorSeventh.for_root(Note.deserialize("c"))
  end

  test "C+7" do
    assert_equal [note("c"), note("e"), note("g♯"), note("b♭")], Chord::AugmentedSeventh.for_root(Note.deserialize("c"))
  end

  test "C−Δ7♭5" do
    assert_equal [note("c"), note("e♭"), note("g♭"), note("b")],
                 Chord::DiminishedMajorSeventh.for_root(Note.deserialize("c"))
  end

  test "C7♭5" do
    assert_equal [note("c"), note("e"), note("g♭"), note("b♭")],
                 Chord::DominantSeventhFlatFive.for_root(Note.deserialize("c"))
  end

  test "CΔ7♭5" do
    assert_equal [note("c"), note("e"), note("g♭"), note("b")],
                 Chord::MajorSeventhFlatFive.for_root(Note.deserialize("c"))
  end
end
