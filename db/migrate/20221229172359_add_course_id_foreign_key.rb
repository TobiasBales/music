class AddCourseIdForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :exercises, :courses, validate: false
  end
end
