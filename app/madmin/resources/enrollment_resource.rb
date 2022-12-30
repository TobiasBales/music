# typed: strict
# frozen_string_literal: true

class EnrollmentResource < Madmin::Resource
  extend T::Sig

  # Attributes
  attribute :id, form: false
  attribute :created_at, form: false
  attribute :updated_at, form: false

  # Associations
  attribute :user
  attribute :course

  sig { params(record: Enrollment).returns(String) }
  def self.display_name(record)
    "Enrollment #{record.user&.email} -> #{record.course&.name}"
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
