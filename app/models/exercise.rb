# typed: strict
# frozen_string_literal: true

class Exercise < ApplicationRecord
  belongs_to :course

  has_one_attached :tab

  validates :name, presence: true
  validates :order, presence: true, uniqueness: { scope: :course }, numericality: { greater_than: 0 }
  validates :bpm, presence: true
end
