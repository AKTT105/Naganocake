class CartProduct < ApplicationRecord
    
    #belongs_to :customer
    belongs_to :product
    
    def tax_on_price
      @product = product.price * 1.10 * amount
      @product.floor
      #@product_all = @product.all.sum
    end
    
    # def total_price
    #   # tax_on_price.all.sum(:price)
    #   total = 0 
    #   self.each do |cart_product|
    #     total += cart_product.tax_on_price
    #   end
    #   total
    # end
end
