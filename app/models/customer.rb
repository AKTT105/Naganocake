class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :deliveries, dependent: :destroy

  validates :postal_code, length: {is: 7}, presence: true
  validates :address, :phone_number, presence: true

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def cart_total_price
    total = 0
    self.cart_products.each do |cart_product|
      total += cart_product.tax_on_price
    end
    total
  end

  def full_name
    self.last_name + self.first_name
  end

end
