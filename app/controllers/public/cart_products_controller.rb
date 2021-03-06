class Public::CartProductsController < ApplicationController
  before_action :authenticate_customer!
    
    def index
      @cart_products = CartProduct.where(product_id: Product.ids,customer_id: current_customer.id)
      #binding.pry
      #@cart_product = CartProduct.find(params[:id])
      #@total_price = @cart_products.sum
    end
    
    def create
      cart_product = CartProduct.new(cart_product_params)
      @product = Product.find(params[:product_id])
      cart_product.product_id = @product.id
      customer = Customer.find_by(id: current_customer)
      
      cart_product.customer_id = customer.id
      if cart_product.save
        
        redirect_to cart_products_path
      else
        @cart_product = CartProduct.new
        @genres = Genre.all
        render template: "public/products/show"
      #redirect_back(fallback_location: admin_product_path)
      end
    end
    
    def update
      @cart_product = CartProduct.find(params[:id])
      @cart_product.update(cart_product_params)
      redirect_to cart_products_path
    end
    
    def destroy
      @cart_product = CartProduct.find(params[:id])
      #binding.pry
      @cart_product.destroy
      redirect_to cart_products_path
    end
    
    def destroy_all
      CartProduct.destroy_all
      #@cart_products = CartProduct.where(product_id: Product.ids)
      #@cart_products.destroy_all
      redirect_to cart_products_path
    end
    
    private
    def cart_product_params
      params.require(:cart_product).permit(:amount)
    end
end
