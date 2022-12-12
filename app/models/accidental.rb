# typed: strict
# frozen_string_literal: true

class Accidental < T::Enum
  extend T::Sig

  enums do
    DoubleFlat = new("♭♭")
    Flat = new("♭")
    Neutral = new("")
    Sharp = new("♯")
    DoubleSharp = new("♯♯")
  end

  # rubocop:disable Metrics/MethodLength
  sig { returns(Accidental) }
  def next
    case self
    when DoubleFlat
      Flat
    when Flat
      Neutral
    when Neutral
      Sharp
    when Sharp
      DoubleSharp
    when DoubleSharp
      raise "#{self} has no next"
    else
      T.absurd(self)
    end
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/MethodLength
  sig { returns(Accidental) }
  def previous
    case self
    when DoubleFlat
      raise "#{self} has no previous"
    when Flat
      DoubleFlat
    when Neutral
      Flat
    when Sharp
      Neutral
    when DoubleSharp
      Sharp
    else
      T.absurd(self)
    end
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/MethodLength
  sig { params(interval: Integer).returns(Accidental) }
  def add_specific_interval(interval)
    interval = interval.remainder(12)

    if interval.zero?
      self
    elsif interval.positive?
      result = self

      while interval.positive?
        result = result.next
        interval -= 1
      end

      result
    elsif interval.negative?
      result = self

      while interval.negative?
        result = result.previous
        interval += 1
      end

      result
    else
      raise "Found integer #{interval} that is neither zero, nor negativ, nor positive"
    end
  end
  # rubocop:enable Metrics/MethodLength
end
