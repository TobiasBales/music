# typed: strict
# frozen_string_literal: true

class Note
  extend T::Sig

  sig { params(input: String).returns(Maybe[Note]) }
  def self.deserialize(input)
    return Maybe.nothing if input.length <= 0
    return Maybe.nothing if input.length > 3

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
end
