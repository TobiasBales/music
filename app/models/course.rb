# typed: strict
# frozen_string_literal: true

class Course < ApplicationRecord
  self.ignored_columns += ["course_id"]

  belongs_to :instrument

  validates :name, presence: true
end
