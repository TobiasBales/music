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

  test "c minor" do
    assert_equal [note("c"), note("e♭"), note("g")], Chord::Minor.for_root(Note.deserialize("c"))
  end

  test "c major" do
    assert_equal [note("c"), note("e"), note("g")], Chord::Major.for_root(Note.deserialize("c"))
  end
end
