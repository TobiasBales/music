# typed: strict
# frozen_string_literal: true

require "test_helper"

class ChordTest < ActiveSupport::TestCase
  test "C" do
    assert_equal [note("c"), note("e"), note("g")],
                 Chord::Major.notes(root: note("c"))
  end

  test "c" do
    assert_equal [note("c"), note("eb"), note("g")],
                 Chord::Minor.notes(root: note("c"))
  end

  test "Co" do
    assert_equal [note("c"), note("eb"), note("gb")],
                 Chord::Diminished.notes(root: note("c"))
  end

  test "C+" do
    assert_equal [note("c"), note("e"), note("g#")],
                 Chord::Augmented.notes(root: note("c"))
  end

  test "CΔ" do
    assert_equal [note("c"), note("e"), note("g"), note("b")],
                 Chord::MajorSeventh.notes(root: note("c"))
  end

  test "C−7" do
    assert_equal [note("c"), note("eb"), note("g"), note("bb")],
                 Chord::MinorSeventh.notes(root: note("c"))
  end

  test "C7" do
    assert_equal [note("c"), note("e"), note("g"), note("bb")],
                 Chord::DominantSeventh.notes(root: note("c"))
  end

  test "Cø7" do
    assert_equal [note("c"), note("eb"), note("gb"), note("bb")],
                 Chord::HalfDiminishedSeventh.notes(root: note("c"))
  end

  test "Co7" do
    assert_equal [note("c"), note("eb"), note("gb"), note("bbb")],
                 Chord::DiminishedSeventh.notes(root: note("c"))
  end

  test "C−Δ7" do
    assert_equal [note("c"), note("eb"), note("g"), note("b")],
                 Chord::MinorMajorSeventh.notes(root: note("c"))
  end

  test "C+7" do
    assert_equal [note("c"), note("e"), note("g#"), note("bb")],
                 Chord::AugmentedSeventh.notes(root: note("c"))
  end

  test "C−Δ7b5" do
    assert_equal [note("c"), note("eb"), note("gb"), note("b")],
                 Chord::DiminishedMajorSeventh.notes(root: note("c"))
  end

  test "C7b5" do
    assert_equal [note("c"), note("e"), note("gb"), note("bb")],
                 Chord::DominantSeventhFlatFive.notes(root: note("c"))
  end

  test "CΔ7b5" do
    assert_equal [note("c"), note("e"), note("gb"), note("b")],
                 Chord::MajorSeventhFlatFive.notes(root: note("c"))
  end
end
