# typed: strict
# frozen_string_literal: true

require "test_helper"

class IntervalTest < ActiveSupport::TestCase
  test "generic_interval + 1 is always the number from the notation" do
    Interval.each_value do |interval|
      assert_equal interval.generic_interval + 1, interval.serialize[1].to_i
    end
  end
end
