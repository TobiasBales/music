# typed: strict
# frozen_string_literal: true

class ProfileResource < Madmin::Resource
  extend T::Sig

  attribute :user
  attribute :count_in
  attribute :mute_exercises
  attribute :id, form: false
  attribute :created_at, form: false, index: false
  attribute :updated_at, form: false, index: false

  sig { params(record: Profile).returns(String) }
  def self.display_name(record)
    "Profile for #{record.user&.email}"
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
