# typed: strict
# frozen_string_literal: true

class Accidental < T::Enum
  enums do
    Neutral = new("")
    Sharp = new("♯")
    Flat = new("♭")
    DoubleSharp = new("♯♯")
    DoubleFlat = new("♭♭")
  end
end
