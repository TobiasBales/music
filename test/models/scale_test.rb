# typed: strict
# frozen_string_literal: true

require "test_helper"

class ScaleTest < ActiveSupport::TestCase
  test "c ionian" do
    assert_equal [note("c"), note("d"), note("e"), note("f"), note("g"), note("a"), note("b")],
                 Scale::Ionian.notes(root: note("c"))
  end

  test "c dorian" do
    assert_equal [note("c"), note("d"), note("eb"), note("f"), note("g"), note("a"), note("bb")],
                 Scale::Dorian.notes(root: note("c"))
  end

  test "c phrygian" do
    assert_equal [note("c"), note("db"), note("eb"), note("f"), note("g"), note("ab"), note("bb")],
                 Scale::Phrygian.notes(root: note("c"))
  end

  test "c lydian" do
    assert_equal [note("c"), note("d"), note("e"), note("f#"), note("g"), note("a"), note("b")],
                 Scale::Lydian.notes(root: note("c"))
  end

  test "c mixolydian" do
    assert_equal [note("c"), note("d"), note("e"), note("f"), note("g"), note("a"), note("bb")],
                 Scale::Mixolydian.notes(root: note("c"))
  end

  test "c aeolian" do
    assert_equal [note("c"), note("d"), note("eb"), note("f"), note("g"), note("ab"), note("bb")],
                 Scale::Aeolian.notes(root: note("c"))
  end

  test "c locrian" do
    assert_equal [note("c"), note("db"), note("eb"), note("f"), note("gb"), note("ab"), note("bb")],
                 Scale::Locrian.notes(root: note("c"))
  end
end
