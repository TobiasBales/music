class AddOrderToExercise < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :order, :int, null: false
  end
end
