# typed: strict
# frozen_string_literal: true

class TabComponent < ViewComponent::Base
  extend T::Sig

  sig { params(tab: String, bpm: Integer, metronome: T::Boolean, count_in: T::Boolean).void }
  def initialize(tab:, bpm: 120, metronome: true, count_in: true)
    super()
    @tab = tab
    @bpm = bpm
    @metronome = metronome
    @count_in = count_in
  end

  sig { returns(String) }
  def tab
    @tab.gsub("BPM", @bpm.to_s)
  end

  sig { returns(T::Boolean) }
  attr_reader :metronome

  sig { returns(T::Boolean) }
  attr_reader :count_in
end
