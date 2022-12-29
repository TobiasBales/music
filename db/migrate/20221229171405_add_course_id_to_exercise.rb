class AddCourseIdToExercise < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :course_id, :uuid
  end
end
