class MakeCourseIdRequired < ActiveRecord::Migration[7.0]
  def change
    add_check_constraint :exercises, "course_id IS NOT NULL", name: "exercises_course_id_null", validate: false
  end
end
