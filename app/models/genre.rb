class Genre < ApplicationRecord
    belongs_to :products
    
    validates :name, presence: true
    validates :is_active, inclusion: { in: [true, false] }
end
