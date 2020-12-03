class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_products, dependent: :destroy

  attachment :image
  validate :genre_id
  validates :name, presence: true
  validates :introduction, presence: true
end
