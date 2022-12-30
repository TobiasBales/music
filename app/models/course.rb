# typed: strict
# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :instrument
  belongs_to :author
  has_many :exercises, dependent: :destroy
  has_many :enrollments, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
end
