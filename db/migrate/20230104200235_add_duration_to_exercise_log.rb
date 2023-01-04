class AddDurationToExerciseLog < ActiveRecord::Migration[7.0]
  def change
    add_column :exercise_logs, :duration, :integer, null: true
  end
end
