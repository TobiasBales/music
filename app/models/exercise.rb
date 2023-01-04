# typed: strict
# frozen_string_literal: true

class Exercise < ApplicationRecord
  belongs_to :course

  validates :name, presence: true
  validates :tab, presence: true
  validates :order, presence: true, uniqueness: { scope: :course }, numericality: { greater_than: 0 }
end
