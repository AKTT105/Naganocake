class Public::CartProductsController < ApplicationController
    
    def index
      @cart_products = CartProduct.where(product_id: Product.ids)
    end
    
    def create
      @product = Product.find_by(params[:product_id])
      @cart_product = CartProduct.new(cart_product_params)
      @cart_product.product_id = @product.id
      @cart_product.customer_id = current_customer
      @cart_product.save
      redirect_to cart_products_path
      logger.debug @cart_product.errors.inspect
    end
    
    def destroy
      @cart_product = CartProduct.find(params[:id])
      if @cart_product.destroy
      flash[:notice] = ""
      redirect_to cart_product_path
      end
    end
    
    private
    def cart_product_params
      params.require(:cart_product).permit(:amount)
    end
end
