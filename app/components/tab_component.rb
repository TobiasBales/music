# typed: strict
# frozen_string_literal: true

class TabComponent < ViewComponent::Base
  extend T::Sig

  sig do
    params(tab: String, type: Symbol, bpm: Integer, metronome: T::Boolean, count_in: T::Boolean, muted: T::Boolean).void
  end
  # rubocop:disable Metrics/ParameterLists
  def initialize(tab:, type:, bpm: 120, metronome: true, count_in: true, muted: false)
    super()

    raise "Type can only be :file or :tex" unless [:file, :tex].include?(type)

    @tab = tab
    @bpm = bpm
    @metronome = metronome
    @count_in = count_in
    @type = type
    @muted = muted
  end
  # rubocop:enable Metrics/ParameterLists

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

  sig { returns(T::Boolean) }
  attr_reader :muted
end
