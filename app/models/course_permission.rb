# typed: strict
# frozen_string_literal: true

class CoursePermission < ApplicationRecord
  belongs_to :course
end
