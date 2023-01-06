# typed: strict
# frozen_string_literal: true

class PasswordResetTokenResource < Madmin::Resource
  extend T::Sig

  attribute :user
  attribute :id, form: false

  sig { params(record: PasswordResetToken).returns(String) }
  def self.display_name(record)
    "PasswordResetToken for #{record.user&.email}"
  end

  sig { returns(String) }
  def self.default_sort_column
    "user_id"
  end

  sig { returns(String) }
  def self.default_sort_direction
    "asc"
  end
end
