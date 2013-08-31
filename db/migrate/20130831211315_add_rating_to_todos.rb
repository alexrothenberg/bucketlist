class AddRatingToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :rating,   :integer
    add_column :todos, :endorsed, :boolean
  end
end
