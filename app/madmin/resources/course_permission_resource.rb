# typed: strict
# frozen_string_literal: true

class CoursePermissionResource < Madmin::Resource
  extend T::Sig

  attribute :course
  attribute :users
  attribute :id, form: false
  attribute :created_at, form: false, index: false
  attribute :updated_at, form: false, index: false

  sig { params(record: CoursePermission).returns(String) }
  def self.display_name(record)
    "Permissions for #{record.course&.name}"
  end

  # sig { returns(String) }
  # def self.default_sort_column
  #   "name"
  # end

  sig { returns(String) }
  def self.default_sort_direction
    "asc"
  end
end
