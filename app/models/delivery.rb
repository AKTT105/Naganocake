class Delivery < ApplicationRecord

    belongs_to :customer

    validates :postal_code, presence: true
    validates :address, presence: true
    validates :name, presence: true

  def delivery_info
    self.postal_code + " " + self.address + " " + self.name
  end

end

