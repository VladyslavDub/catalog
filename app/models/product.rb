class Product < ApplicationRecord
    belongs_to :maker, counter_cache: true
    belongs_to :category, counter_cache: true
  
    has_one_attached :image
    has_many_attached :images
  
    scope :availables, -> {where(available: true)}
    scope :unavailables, -> {where(available: false)}

    validates :name, uniqueness: true
  end