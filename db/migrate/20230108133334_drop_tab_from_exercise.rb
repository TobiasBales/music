class DropTabFromExercise < ActiveRecord::Migration[7.0]
  def change
    safety_assured do
      remove_column :exercises, :tab
    end
  end
end
