class AddMuteExercisesToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :mute_exercises, :boolean, null: false, default: false
  end
end
