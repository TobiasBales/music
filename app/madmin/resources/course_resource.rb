# typed: strict
# frozen_string_literal: true

class CourseResource < Madmin::Resource
  extend T::Sig

  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :description, index: false
  attribute :link, index: false
  attribute :created_at, form: false, index: false
  attribute :updated_at, form: false, index: false
  attribute :image, index: false

  # Associations
  attribute :instrument
  attribute :author
  attribute :exercises
  attribute :enrollments

  sig { params(record: Course).returns(String) }
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
