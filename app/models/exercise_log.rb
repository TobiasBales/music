# typed: strict
# frozen_string_literal: true

class ExerciseLog < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  validates :bpm, presence: true, numericality: { greater_than: 0 }
  validates :time, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
end
