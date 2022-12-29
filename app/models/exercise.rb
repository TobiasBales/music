# typed: strict
# frozen_string_literal: true

class Exercise < ApplicationRecord
  self.ignored_columns += ["instrument_id"]

  validates :name, presence: true
  validates :tab, presence: true
end
