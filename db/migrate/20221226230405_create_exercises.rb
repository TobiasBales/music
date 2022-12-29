# typed: true
# frozen_string_literal: true

class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises, id: :uuid do |t|
      t.string :name
      t.string :tab

      t.timestamps
    end
  end
end
