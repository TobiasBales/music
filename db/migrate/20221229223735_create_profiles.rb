class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles, id: :uuid do |t|
      t.boolean :count_in
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
