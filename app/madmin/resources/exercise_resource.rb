# typed: strict
# frozen_string_literal: true

class ExerciseResource < Madmin::Resource
  extend T::Sig

  attribute :name
  attribute :course
  attribute :order
  attribute :bpm
  attribute :tab, index: false
  attribute :id, form: false
  attribute :created_at, form: false, index: false
  attribute :updated_at, form: false, index: false

  sig { params(record: Exercise).returns(String) }
  def self.display_name(record)
    record.name
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
