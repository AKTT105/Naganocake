class AddAdressToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :adress, :string
  end
end
