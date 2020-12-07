class RemoveUpdateAtFromGenres < ActiveRecord::Migration[5.2]
  def up
    remove_column :genres, :update_at
  end

  def down
    add_column :genres, :update_at, :datetime
  end

end
