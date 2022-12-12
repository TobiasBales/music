# typed: strict
# frozen_string_literal: true

class Chord < T::Enum
  extend T::Sig

  enums do
    Augmented = new
    Diminished = new
    Major = new
    Minor = new
  end

  # rubocop:disable Metrics/MethodLength
  sig { returns(T::Array[Interval]) }
  def intervals
    case self
    when Augmented
      [Interval::MajorThird, Interval::AugmentedFifth]
    when Diminished
      [Interval::MinorThird, Interval::DiminishedFifth]
    when Major
      [Interval::MajorThird, Interval::PerfectFifth]
    when Minor
      [Interval::MinorThird, Interval::PerfectFifth]
    else
      T.absurd(self)
    end
  end
  # rubocop:enable Metrics/MethodLength

  sig { params(root: Note).returns(T::Array[Note]) }
  def for_root(root)
    [root].concat(intervals.map { |interval| root.add(interval) })
  end
end
