# typed: strict
# frozen_string_literal: true

class Note
  extend T::Sig

  sig { params(input: String).returns(Maybe[Note]) }
  def self.deserialize(input)
    return Maybe.nothing if input.length <= 0
    return Maybe.nothing if input.length > 4

    name = LetterName.deserialize(input.first)

    return Maybe.just(Note.new(name)) if input.length == 1

    accidental = Accidental.deserialize(input[1..])

    Maybe.just(Note.new(name, accidental))
  rescue KeyError
    Maybe.nothing
  end

  sig { params(name: LetterName, accidental: Accidental).void }
  def initialize(name, accidental = Accidental::Neutral)
    @name = name
    @accidental = accidental
  end

  sig { returns(LetterName) }
  attr_reader :name

  sig { returns(Accidental) }
  attr_reader :accidental

  sig { returns(String) }
  def serialize
    "#{name.serialize}#{accidental.serialize}"
  end

  sig { params(interval: Interval).returns(Note) }
  def add(interval)
    new_name = name.add_generic_interval(interval.generic_interval)

    specific_interval_offset = interval.specific_interval - name.specific_interval(to: new_name)

    new_accidental = accidental.add_specific_interval(specific_interval_offset)
    Note.new(new_name, new_accidental)
  end

  sig { params(other: T.untyped).returns(T::Boolean) }
  def ==(other)
    return false unless other.is_a?(Note)

    name == other.name && accidental == other.accidental
  end
end
