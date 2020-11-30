class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.order_id :integer
      t.product_id :integer
      t.price :integer
      t.amount :integer
      t.making_status :integer
      

      t.timestamps
    end
  end
end
