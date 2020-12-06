class OrderProduct < ApplicationRecord
  
  belongs_to :order
  belongs_to :product

  enum making_status: {
    制作不可: 0,
    制作待ち: 1,
    制作中:   2,
    制作完了: 3
  }
  
  # ActiveRcordのところに書く？
  # before_save do
  #   self.price = Product.price * 1.1
  # end
  
  # 注文商品の小計を算出するメソッド
  def total_price
    self.price*amount
  end

  
end
