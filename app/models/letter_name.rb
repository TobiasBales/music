# typed: strict
# frozen_string_literal: true

class LetterName < T::Enum
  extend T::Sig

  enums do
    A = new
    B = new
    C = new
    D = new
    E = new
    F = new
    G = new
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  sig { returns(LetterName) }
  def next
    case self
    when A
      B
    when B
      C
    when C
      D
    when D
      E
    when E
      F
    when F
      G
    when G
      A
    else
      T.absurd(self)
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

  sig { params(interval: Integer).returns(LetterName) }
  def add_generic_interval(interval)
    raise "interval can't be negative" if interval.negative?

    result = dup

    while interval.positive?
      result = result.next
      interval -= 1
    end

    result
  end
end
