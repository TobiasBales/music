# typed: strict
# frozen_string_literal: true

class AuthorResource < Madmin::Resource
  extend T::Sig

  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :created_at, form: false
  attribute :updated_at, form: false

  # Associations
  attribute :courses

  sig { params(record: Author).returns(String) }
  def self.display_name(record)
    record.name
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
