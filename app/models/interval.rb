# typed: strict
# frozen_string_literal: true

class Interval < T::Enum
  extend T::Helpers
  extend T::Sig

  # TODO: add [compound intervals](https://en.wikipedia.org/wiki/Interval_(music)#Compound_intervals)

  enums do
    PerfectUnision = new("P1")
    AugmentedUnison = new("A1")
    DiminishedSecond = new("d2")
    MinorSecond = new("m2")
    MajorSecond = new("M2")
    AugmentedSecond = new("A2")
    DiminishedThird = new("d3")
    MinorThird = new("m3")
    MajorThird = new("M3")
    AugmentedThird = new("A3")
    DiminishedFourth = new("d4")
    PerfectFourth = new("P4")
    AugmentedFourth = new("A4")
    DiminishedFifth = new("d5")
    PerfectFifth = new("P5")
    AugmentedFifth = new("A5")
    DiminishedSixth = new("d6")
    MinorSixth = new("m6")
    MajorSixth = new("M6")
    AugmentedSixth = new("A6")
    DiminishedSeventh = new("d7")
    MinorSeventh = new("m7")
    MajorSeventh = new("M7")
    AugmentedSeventh = new("A7")
    PerfectOctave = new("P8")
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  sig { returns(Integer) }
  def generic_interval
    case self
    when PerfectUnision, AugmentedUnison
      0
    when DiminishedSecond, MinorSecond, MajorSecond, AugmentedSecond
      1
    when DiminishedThird, MinorThird, MajorThird, AugmentedThird
      2
    when DiminishedFourth, PerfectFourth, AugmentedFourth
      3
    when DiminishedFifth, PerfectFifth, AugmentedFifth
      4
    when DiminishedSixth, MinorSixth, MajorSixth, AugmentedSixth
      5
    when DiminishedSeventh, MinorSeventh, MajorSeventh, AugmentedSeventh
      6
    when PerfectOctave
      7
    else
      T.absurd(self)
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  sig { returns(Integer) }
  def specific_interval
    case self
    when PerfectUnision, DiminishedSecond
      0
    when AugmentedUnison, MinorSecond
      1
    when MajorSecond, DiminishedThird
      2
    when AugmentedSecond, MinorThird
      3
    when MajorThird, DiminishedFourth
      4
    when AugmentedThird, PerfectFourth, DiminishedFifth
      5
    when AugmentedFourth, PerfectFifth, DiminishedSixth
      7
    when AugmentedFifth, MinorSixth
      8
    when MajorSixth, DiminishedSeventh
      9
    when AugmentedSixth, MinorSeventh
      10
    when MajorSeventh
      11
    when AugmentedSeventh, PerfectOctave
      12
    else
      T.absurd(self)
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

  alias semitones specific_interval
  alias letter_names generic_interval
end
