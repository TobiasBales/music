# typed: strict
# frozen_string_literal: true

class Scale < T::Enum
  extend T::Sig

  include RootAndInterval

  enums do
    # major modes
    Ionian = new
    Dorian = new
    Phrygian = new
    Lydian = new
    Mixolydian = new
    Aeolian = new
    Locrian = new
  end

  # rubocop:disable Metrics/MethodLength
  sig { returns(T::Array[Interval]) }
  def intervals
    case self
    when Ionian
      [I::MajorSecond, I::MajorThird, I::PerfectFourth, I::PerfectFifth, I::MajorSixth, I::MajorSeventh]
    when Dorian
      [I::MajorSecond, I::MinorThird, I::PerfectFourth, I::PerfectFifth, I::MajorSixth, I::MinorSeventh]
    when Phrygian
      [I::MinorSecond, I::MinorThird, I::PerfectFourth, I::PerfectFifth, I::MinorSixth, I::MinorSeventh]
    when Lydian
      [I::MajorSecond, I::MajorThird, I::AugmentedFourth, I::PerfectFifth, I::MajorSixth, I::MajorSeventh]
    when Mixolydian
      [I::MajorSecond, I::MajorThird, I::PerfectFourth, I::PerfectFifth, I::MajorSixth, I::MinorSeventh]
    when Aeolian
      [I::MajorSecond, I::MinorThird, I::PerfectFourth, I::PerfectFifth, I::MinorSixth, I::MinorSeventh]
    when Locrian
      [I::MinorSecond, I::MinorThird, I::PerfectFourth, I::DiminishedFifth, I::MinorSixth, I::MinorSeventh]
    else
      T.absurd(self)
    end
  end
  # rubocop:enable Metrics/MethodLength

  sig { params(root: Note).returns(T::Array[Note]) }
  def notes(root:)
    build(root: root, intervals: intervals)
  end
end
