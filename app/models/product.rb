class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_products, dependent: :destroy

  attachment :image
  validates :name, presence: true
  validates :introduction, presence: true
  validates :is_active, inclusion: {in: [true, false]}

  def tax_on
    @tax_on_price = self.price * 1.10
    @tax_on_price.floor
  end
  
  
end
