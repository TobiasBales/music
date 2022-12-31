# typed: strict
# frozen_string_literal: true

class CoursePermission < ApplicationRecord
  belongs_to :course

  # rubocop:disable Rails/HasAndBelongsToMany
  has_and_belongs_to_many :users
  # rubocop:enable Rails/HasAndBelongsToMany
end
