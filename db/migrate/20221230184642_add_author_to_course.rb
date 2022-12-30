class AddAuthorToCourse < ActiveRecord::Migration[7.0]
  def change
    safety_assured do
      add_column :courses, :author_id, :uuid, null: false
      add_foreign_key :courses, :authors
    end
  end
end
