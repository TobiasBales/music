class AddExerciseOrderUniquenessConstraint < ActiveRecord::Migration[7.0]
  def change
    safety_assured do
      add_index :exercises, [:course_id, :order], unique: true
    end
  end
end
