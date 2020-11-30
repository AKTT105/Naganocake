class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.string :customer_id
      t.string :postal_code
      t.string :address    
      t.string  :name     
      t.integer :postage
      t.integer :total_payment
      t.integer :payment_type
      t.integer :status   
      
      t.timestamps
    end
  end
end
