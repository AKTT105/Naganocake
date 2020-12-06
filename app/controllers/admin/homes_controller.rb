class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @products = Order
    @count = @products.count
  end
end
