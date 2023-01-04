class AddBpmToExercise < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :bpm, :integer
  end
end
