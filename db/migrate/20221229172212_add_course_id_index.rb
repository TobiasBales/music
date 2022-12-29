class AddCourseIdIndex < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  
  def change
    add_index :exercises, :course_id, algorithm: :concurrently
  end
end
