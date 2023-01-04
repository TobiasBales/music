class CreateExerciseLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_logs, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :exercise, null: false, foreign_key: true, type: :uuid
      t.integer :bpm, null: false

      t.timestamps
    end
  end
end
