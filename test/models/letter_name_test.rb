# typed: strict
# frozen_string_literal: true

require "test_helper"

class LetterNameTest < ActiveSupport::TestCase
  # rubocop:disable Minitest/MultipleAssertions
  test "#add_generic_interval(0) is equal the original letter" do
    LetterName.each_value do |letter_name|
      assert_equal letter_name, letter_name.add_generic_interval(0)
    end
  end

  test "#add_generic_interval(1) is equal to calling next" do
    LetterName.each_value do |letter_name|
      assert_equal letter_name.next, letter_name.add_generic_interval(1)
    end
  end

  test "#add_generic_interval works for C" do
    assert_equal LetterName::C, LetterName::C.add_generic_interval(0)
    assert_equal LetterName::D, LetterName::C.add_generic_interval(1)
    assert_equal LetterName::E, LetterName::C.add_generic_interval(2)
    assert_equal LetterName::F, LetterName::C.add_generic_interval(3)
    assert_equal LetterName::G, LetterName::C.add_generic_interval(4)
    assert_equal LetterName::A, LetterName::C.add_generic_interval(5)
    assert_equal LetterName::B, LetterName::C.add_generic_interval(6)
    assert_equal LetterName::C, LetterName::C.add_generic_interval(7)
  end

  test "#specific_interval works for C" do
    assert_equal(0, LetterName::C.specific_interval(to: LetterName::C))
    assert_equal(2, LetterName::C.specific_interval(to: LetterName::D))
    assert_equal(4, LetterName::C.specific_interval(to: LetterName::E))
    assert_equal(5, LetterName::C.specific_interval(to: LetterName::F))
    assert_equal(7, LetterName::C.specific_interval(to: LetterName::G))
    assert_equal(9, LetterName::C.specific_interval(to: LetterName::A))
    assert_equal(11, LetterName::C.specific_interval(to: LetterName::B))
  end
  # rubocop:enable Minitest/MultipleAssertions
end
