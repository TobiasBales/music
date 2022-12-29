class ValidateMakeCourseIdRequired < ActiveRecord::Migration[7.0]
  def up
    validate_check_constraint :exercises, name: "exercises_course_id_null"
    change_column_null :exercises, :course_id, false
    remove_check_constraint :exercises, name: "exercises_course_id_null"
  end

  def down
    add_check_constraint :exercises, "course_id IS NOT NULL", name: "exercises_course_id_null", validate: false
    change_column_null :exercises, :course_id, true
  end
end
