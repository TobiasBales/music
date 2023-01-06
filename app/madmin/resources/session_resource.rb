# typed: strict
# frozen_string_literal: true

class SessionResource < Madmin::Resource
  extend T::Sig

  attribute :user
  attribute :user_agent
  attribute :ip_address
  attribute :id, form: false
  attribute :created_at, form: false, index: false
  attribute :updated_at, form: false, index: false

  sig { params(record: Session).returns(String) }
  def self.display_name(record)
    "Session for #{record.user&.email}"
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
