class AddStaffToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :staff, :boolean, null: false, default: false
  end
end
