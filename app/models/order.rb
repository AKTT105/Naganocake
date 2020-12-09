class Order < ApplicationRecord

  belongs_to :customer

  has_many :order_products, dependent: :destroy
  attachment :product

  enum payment_type: {
    クレジットカード: 1,
    銀行振込:         2
  }

  enum status: {
    入金待ち:   0,
    入金確認:   1,
    制作中:     2,
    発送準備中: 3,
    発送済み:   4
  }

  enum address_type: {
    ご自身の住所: :A,
    登録済み住所: :B,
    新しいお届け先: :C,
  }


  def order_total_price
    order_products.to_a.sum{|order_product| order_product.total_price}
  end

  def total_pay
    self.total_payment = order_total_price + postage
  end

end