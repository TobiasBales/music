class ValidateAddCourseIdIndexAndConstraint < ActiveRecord::Migration[7.0]
  def change
    validate_foreign_key :exercises, :courses
  end
end
