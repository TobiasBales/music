# typed: strict
# frozen_string_literal: true

class UserResource < Madmin::Resource
  extend T::Sig

  # Attributes
  attribute :id, form: false
  attribute :email
  attribute :verified
  attribute :admin
  attribute :staff
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :password, index: false, show: false
  attribute :password_confirmation, index: false, show: false

  # Associations
  attribute :email_verification_tokens
  attribute :password_reset_tokens
  attribute :sessions
  attribute :profile
  attribute :enrollments
  attribute :course_permissions

  sig { params(record: User).returns(String) }
  def self.display_name(record)
    record.email
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
