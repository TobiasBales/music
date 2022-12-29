class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses, id: :uuid do |t|
      t.string :name
      t.references :instrument, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
