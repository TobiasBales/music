# typed: strict
# frozen_string_literal: true

class Exercise < ApplicationRecord
  validates :name, presence: true
  validates :tab, presence: true
end
