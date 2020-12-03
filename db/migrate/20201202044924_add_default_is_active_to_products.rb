class AddDefaultIsActiveToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :is_active, :boolean, :default => TRUE
  end
end