# typed: strict
# frozen_string_literal: true

class Chord < T::Enum
  extend T::Sig

  enums do
    Augmented = new
    AugmentedSeventh = new
    Diminished = new
    DiminishedMajorSeventh = new
    DiminishedSeventh = new
    DominantSeventh = new
    DominantSeventhFlatFive = new
    HalfDiminishedSeventh = new
    Major = new
    MajorSeventh = new
    MajorSeventhFlatFive = new
    Minor = new
    MinorMajorSeventh = new
    MinorSeventh = new
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  sig { returns(T::Array[Interval]) }
  def intervals
    case self
    when Augmented
      [Interval::MajorThird, Interval::AugmentedFifth]
    when AugmentedSeventh
      [Interval::MajorThird, Interval::AugmentedFifth, Interval::MinorSeventh]
    when Diminished
      [Interval::MinorThird, Interval::DiminishedFifth]
    when DiminishedMajorSeventh
      [Interval::MinorThird, Interval::DiminishedFifth, Interval::MajorSeventh]
    when DiminishedSeventh
      [Interval::MinorThird, Interval::DiminishedFifth, Interval::DiminishedSeventh]
    when DominantSeventh
      [Interval::MajorThird, Interval::PerfectFifth, Interval::MinorSeventh]
    when DominantSeventhFlatFive
      [Interval::MajorThird, Interval::DiminishedFifth, Interval::MinorSeventh]
    when HalfDiminishedSeventh
      [Interval::MinorThird, Interval::DiminishedFifth, Interval::MinorSeventh]
    when Major
      [Interval::MajorThird, Interval::PerfectFifth]
    when MajorSeventh
      [Interval::MajorThird, Interval::PerfectFifth, Interval::MajorSeventh]
    when MajorSeventhFlatFive
      [Interval::MajorThird, Interval::DiminishedFifth, Interval::MajorSeventh]
    when Minor
      [Interval::MinorThird, Interval::PerfectFifth]
    when MinorMajorSeventh
      [Interval::MinorThird, Interval::PerfectFifth, Interval::MajorSeventh]
    when MinorSeventh
      [Interval::MinorThird, Interval::PerfectFifth, Interval::MinorSeventh]
    else
      T.absurd(self)
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

  sig { params(root: Note).returns(T::Array[Note]) }
  def for_root(root)
    [root].concat(intervals.map { |interval| root.add(interval) })
  end
end
