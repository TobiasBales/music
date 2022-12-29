class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email,           null: false
      t.string :password_digest, null: false

      t.boolean :verified, null: false, default: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
