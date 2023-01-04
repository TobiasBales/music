# typed: strict
# frozen_string_literal: true

class ExerciseLog < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  validates :bpm, presence: true
end
