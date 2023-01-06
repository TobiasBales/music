# typed: strict
# frozen_string_literal: true

class TabResource < Madmin::Resource
  extend T::Sig

  attribute :artist
  attribute :album
  attribute :song
  attribute :tab, index: false
  attribute :id, form: false
  attribute :created_at, form: false, index: false
  attribute :updated_at, form: false, index: false

  sig { params(record: Tab).returns(String) }
  def self.display_name(record)
    "#{record.artist} - #{record.song}"
  end

  sig { returns(String) }
  def self.default_sort_column
    "artist"
  end

  sig { returns(String) }
  def self.default_sort_direction
    "desc"
  end
end
