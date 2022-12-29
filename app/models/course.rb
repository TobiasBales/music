# typed: strict
# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :instrument
  has_many :exercises, dependent: :destroy

  validates :name, presence: true
end