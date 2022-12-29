# typed: strict
# frozen_string_literal: true

class Exercise < ApplicationRecord
  belongs_to :course

  validates :name, presence: true
  validates :tab, presence: true
end
