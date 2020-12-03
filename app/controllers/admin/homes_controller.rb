class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @products = OrderedProduct.created_today
    @count = @products.count
  end
end
