class CreateTabs < ActiveRecord::Migration[7.0]
  def change
    create_table :tabs, id: :uuid do |t|
      t.string :artist, null: false
      t.string :album
      t.string :song, null: false

      t.timestamps
    end
  end
end
