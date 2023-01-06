# typed: strict
# frozen_string_literal: true

class AuthorResource < Madmin::Resource
  extend T::Sig

  attribute :name
  attribute :courses
  attribute :id, form: false
  attribute :created_at, form: false, index: false
  attribute :updated_at, form: false, index: false

  sig { params(record: Author).returns(String) }
  def self.display_name(record)
    record.name
  end

  sig { returns(String) }
  def self.default_sort_column
    "name"
  end

  sig { returns(String) }
  def self.default_sort_direction
    "asc"
  end
end
