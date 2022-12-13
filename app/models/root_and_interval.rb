# typed: strict
# frozen_string_literal: true

module RootAndInterval
  extend T::Sig
  sig { params(root: Note, intervals: T::Array[Interval]).returns(T::Array[Note]) }
  def build(root:, intervals:)
    [root].concat(intervals.map { |interval| root.add(interval) })
  end
end
