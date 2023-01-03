class AddNonNullConstraints < ActiveRecord::Migration[7.0]
  def up
    safety_assured do
      change_column :authors, :name, :string, null: false
      change_column :courses, :name, :string, null: false
      change_column :courses, :instrument_id, :uuid, null: false
      change_column :exercises, :name, :string, null: false
      change_column :exercises, :tab, :text, null: false
      change_column :instruments, :name, :string, null: false
      change_column :profiles, :count_in, :boolean, null: false
    end
  end
    
  def down
    safety_assured do
      change_column :authors, :name, :string, null: true
      change_column :courses, :name, :string, null: true
      change_column :courses, :instrument_id, :uuid, null: true
      change_column :exercises, :name, :string, null: true
      change_column :exercises, :tab, :text, null: true
      change_column :instruments, :name, :string, null: true
      change_column :profiles, :count_in, :boolean, null: true
    end
  end
end
