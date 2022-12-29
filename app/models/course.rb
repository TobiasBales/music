# typed: strict
# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :instrument

  validates :name, presence: true
end
