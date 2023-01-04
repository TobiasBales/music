class MakeExerciseDurationNonNull < ActiveRecord::Migration[7.0]
  def up
    safety_assured do
      change_column :exercise_logs, :duration, :integer, null: false
    end
  end

  def down
    safety_assured do
      change_column :exercise_logs, :duration, :integer, null: true
    end
  end
end
