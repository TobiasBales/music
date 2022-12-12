# typed: strict
# frozen_string_literal: true

require "test_helper"

class AccidentalTest < ActiveSupport::TestCase
  test "next works" do
    assert_equal Accidental::DoubleFlat, Accidental::TripleFlat.next
    assert_equal Accidental::Flat, Accidental::DoubleFlat.next
    assert_equal Accidental::Neutral, Accidental::Flat.next
    assert_equal Accidental::Sharp, Accidental::Neutral.next
    assert_equal Accidental::DoubleSharp, Accidental::Sharp.next
    assert_equal Accidental::TripleSharp, Accidental::DoubleSharp.next
    assert_raises do
      Accidental::TripleSharp.next
    end
  end

  test "previous works" do
    assert_raises do
      Accidental::TripleFlat.previous
    end
    assert_equal Accidental::TripleFlat, Accidental::DoubleFlat.previous
    assert_equal Accidental::DoubleFlat, Accidental::Flat.previous
    assert_equal Accidental::Flat, Accidental::Neutral.previous
    assert_equal Accidental::Neutral, Accidental::Sharp.previous
    assert_equal Accidental::Sharp, Accidental::DoubleSharp.previous
    assert_equal Accidental::DoubleSharp, Accidental::TripleSharp.previous
  end
end
