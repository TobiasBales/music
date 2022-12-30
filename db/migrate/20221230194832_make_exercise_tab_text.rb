class MakeExerciseTabText < ActiveRecord::Migration[7.0]
  def change
    change_column :exercises, :tab, :text
  end
end
