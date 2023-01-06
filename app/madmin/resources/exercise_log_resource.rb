# typed: strict
# frozen_string_literal: true

class ExerciseLogResource < Madmin::Resource
  extend T::Sig

  attribute :exercise
  attribute :user
  attribute :bpm
  attribute :time
  attribute :duration
  attribute :id, form: false
  attribute :created_at, form: false, index: false
  attribute :updated_at, form: false, index: false

  sig { params(record: ExerciseLog).returns(String) }
  def self.display_name(record)
    "Exercise log for #{record.exercise&.name}  #{record.user&.email} on #{record.time}"
  end

  sig { returns(String) }
  def self.default_sort_column
    "created_at"
  end

  sig { returns(String) }

  def self.default_sort_direction
    "desc"
  end
end
