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
      [I::MinorThird, I::DiminishedFifth]
    when Augmented
      [I::MajorThird, I::AugmentedFifth]
    when Major
      [I::MajorThird, I::PerfectFifth]
    when Minor
      [I::MinorThird, I::PerfectFifth]
    when MajorSeventh
      [I::MajorThird, I::PerfectFifth, I::MajorSeventh]
    when MinorSeventh
      [I::MinorThird, I::PerfectFifth, I::MinorSeventh]
    when DominantSeventh
      [I::MajorThird, I::PerfectFifth, I::MinorSeventh]
    when HalfDiminishedSeventh
      [I::MinorThird, I::DiminishedFifth, I::MinorSeventh]
    when DiminishedSeventh
      [I::MinorThird, I::DiminishedFifth, I::DiminishedSeventh]
    when MinorMajorSeventh
      [I::MinorThird, I::PerfectFifth, I::MajorSeventh]
    when AugmentedSeventh
      [I::MajorThird, I::AugmentedFifth, I::MinorSeventh]
    when DiminishedMajorSeventh
      [I::MinorThird, I::DiminishedFifth, I::MajorSeventh]
    when MajorSeventhFlatFive
      [I::MajorThird, I::DiminishedFifth, I::MajorSeventh]
    when DominantSeventhFlatFive
      [I::MajorThird, I::DiminishedFifth, I::MinorSeventh]
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
