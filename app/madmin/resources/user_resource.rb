# typed: strict
# frozen_string_literal: true

class UserResource < Madmin::Resource
  extend T::Sig

  # Attributes
  attribute :id, form: false
  attribute :email
  attribute :verified
  attribute :admin
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

  sig { params(record: User).returns(String) }
  def self.display_name(record)
    record.email
  end

  # Uncomment this to customize the display name of records in the admin area.
  # def self.display_name(record)
  #   record.name
  # end

  # Uncomment this to customize the default sort column and direction.
  # def self.default_sort_column
  #   "created_at"
  # end
  #
  # def self.default_sort_direction
  #   "desc"
  # end
end
