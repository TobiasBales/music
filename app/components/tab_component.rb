# typed: strict
# frozen_string_literal: true

class TabComponent < ViewComponent::Base
  extend T::Sig

  sig { params(tab: String, type: Symbol, bpm: Integer, metronome: T::Boolean, count_in: T::Boolean).void }
  def initialize(tab:, type:, bpm: 120, metronome: true, count_in: true)
    super()

    raise "Type can only be :file or :tex" unless [:file, :tex].include?(type)

    @tab = tab
    @bpm = bpm
    @metronome = metronome
    @count_in = count_in
    @type = type
  end

  sig { returns(String) }
  attr_reader :tab

  sig { returns(Integer) }
  attr_reader :bpm

  sig { returns(T::Boolean) }
  attr_reader :metronome

  sig { returns(T::Boolean) }
  attr_reader :count_in

  sig { returns(Symbol) }
  attr_reader :type
end
