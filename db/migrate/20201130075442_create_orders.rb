class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.customer_id :integer
      t.postal_code :string
      t.address :string    
      t.name :string       
      t.postage :integer   
      t.total_payment :integer
      t.payment_type :integer
      t.status :integer   
      
      t.timestamps
    end
  end
end
