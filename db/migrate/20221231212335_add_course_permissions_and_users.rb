class AddCoursePermissionsAndUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :course_permissions_users, id: false do |t|
      t.belongs_to :course_permission, type: :uuid, foreign_key: true, null: false
      t.belongs_to :user, type: :uuid, foreign_key: true, null: false
    end
  end
end
