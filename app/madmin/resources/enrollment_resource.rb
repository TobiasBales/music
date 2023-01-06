# typed: strict
# frozen_string_literal: true

class EnrollmentResource < Madmin::Resource
  extend T::Sig

  attribute :user
  attribute :course
  attribute :id, form: false
  attribute :created_at, form: false, index: false
  attribute :updated_at, form: false, index: false

  sig { params(record: Enrollment).returns(String) }
  def self.display_name(record)
    "Enrollment #{record.user&.email} -> #{record.course&.name}"
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
