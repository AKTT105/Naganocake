class AdminView < ActiveRecord::Migration[5.2]
  def change
    drop_table :admin_views
  end
end
