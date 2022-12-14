# typed: strict
# frozen_string_literal: true

class Instrument < ApplicationRecord
  has_many :courses, dependent: :destroy

  validates :name, presence: true
end
