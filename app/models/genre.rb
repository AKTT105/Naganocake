class Genre < ApplicationRecord
    belongs_to :products, optional: true

    validates :name, presence: true
    #validates :is_active, inclusion: { in: [true, false] }
end
