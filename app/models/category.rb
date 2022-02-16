class Category < ApplicationRecord
    has_many :products
    validates :name, uniqueness: true

    scope :not_blank, ->{where.not(products_count: 0)}
end
