class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_products
  attachment :image
end
