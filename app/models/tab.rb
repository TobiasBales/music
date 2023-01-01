# typed: strict
# frozen_string_literal: true

class Tab < ApplicationRecord
  extend T::Sig

  validates :artist, presence: true
  validates :song, presence: true

  has_one_attached :tab

  sig { returns(String) }
  def display_name
    "#{artist} - #{song}"
  end
end
