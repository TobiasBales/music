# typed: strict
# frozen_string_literal: true

class Chord < T::Enum
  extend T::Sig

  include RootAndInterval

  enums do
    # triads
    Diminished = new
    Augmented = new
    Major = new
    Minor = new
    # seventh tertian
    MajorSeventh = new
    MinorSeventh = new
    DominantSeventh = new
    HalfDiminishedSeventh = new
    DiminishedSeventh = new
    MinorMajorSeventh = new
    # seventh non-tertian
    AugmentedSeventh = new
    DiminishedMajorSeventh = new
    DominantSeventhFlatFive = new
    MajorSeventhFlatFive = new
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  sig { returns(T::Array[Interval]) }
  def intervals
    case self
    when Diminished
      [Interval::MinorThird, Interval::DiminishedFifth]
    when Augmented
      [Interval::MajorThird, Interval::AugmentedFifth]
    when Major
      [Interval::MajorThird, Interval::PerfectFifth]
    when Minor
      [Interval::MinorThird, Interval::PerfectFifth]
    when MajorSeventh
      [Interval::MajorThird, Interval::PerfectFifth, Interval::MajorSeventh]
    when MinorSeventh
      [Interval::MinorThird, Interval::PerfectFifth, Interval::MinorSeventh]
    when DominantSeventh
      [Interval::MajorThird, Interval::PerfectFifth, Interval::MinorSeventh]
    when HalfDiminishedSeventh
      [Interval::MinorThird, Interval::DiminishedFifth, Interval::MinorSeventh]
    when DiminishedSeventh
      [Interval::MinorThird, Interval::DiminishedFifth, Interval::DiminishedSeventh]
    when MinorMajorSeventh
      [Interval::MinorThird, Interval::PerfectFifth, Interval::MajorSeventh]
    when AugmentedSeventh
      [Interval::MajorThird, Interval::AugmentedFifth, Interval::MinorSeventh]
    when DiminishedMajorSeventh
      [Interval::MinorThird, Interval::DiminishedFifth, Interval::MajorSeventh]
    when MajorSeventhFlatFive
      [Interval::MajorThird, Interval::DiminishedFifth, Interval::MajorSeventh]
    when DominantSeventhFlatFive
      [Interval::MajorThird, Interval::DiminishedFifth, Interval::MinorSeventh]
    else
      T.absurd(self)
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

  sig { params(root: Note).returns(T::Array[Note]) }
  def notes(root:)
    build(root: root, intervals: intervals)
  end
end
