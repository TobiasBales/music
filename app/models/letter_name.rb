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

  sig { returns(Integer) }
  def specific_interval_to_next
    case self
    when A, C, D, F, G
      2
    when B, E
      1
    else
      T.absurd(self)
    end
  end

  sig { params(to: LetterName).returns(Integer) }
  def specific_interval(to:)
    distance = 0

    current = dup

    while current != to
      distance += current.specific_interval_to_next
      current = current.next
    end

    distance
  end

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
