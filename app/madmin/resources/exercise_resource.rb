# typed: strict
# frozen_string_literal: true

class ExerciseResource < Madmin::Resource
  extend T::Sig

  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :tab
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :order
  attribute :bpm

  # Associations
  attribute :course

  # Uncomment this to customize the display name of records in the admin area.
  sig { params(record: Exercise).returns(String) }
  def self.display_name(record)
    record.name
  end

  # Uncomment this to customize the default sort column and direction.
  # def self.default_sort_column
  #   "created_at"
  # end
  #
  # def self.default_sort_direction
  #   "desc"
  # end
end
