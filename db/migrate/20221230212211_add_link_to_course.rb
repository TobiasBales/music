class AddLinkToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :link, :string
  end
end
