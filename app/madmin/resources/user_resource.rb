# typed: strict
# frozen_string_literal: true

class UserResource < Madmin::Resource
  extend T::Sig

  attribute :email
  attribute :verified
  attribute :admin
  attribute :staff
  attribute :profile
  attribute :email_verification_tokens
  attribute :password_reset_tokens
  attribute :sessions
  attribute :enrollments
  attribute :course_permissions
  attribute :id, form: false
  attribute :password, index: false, show: false
  attribute :password_confirmation, index: false, show: false
  attribute :created_at, form: false
  attribute :updated_at, form: false

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
