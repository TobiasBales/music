class CreateCoursePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :course_permissions, id: :uuid do |t|
      t.references :course, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
