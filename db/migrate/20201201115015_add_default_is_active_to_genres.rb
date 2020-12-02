class AddDefaultIsActiveToGenres < ActiveRecord::Migration[5.2]
  def change
    change_column :genres, :is_active, :boolean, :default => TRUE
  end
end
