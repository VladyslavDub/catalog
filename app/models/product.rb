class Product < ApplicationRecord
    belongs_to :maker
    belongs_to :category
  
    has_one_attached :image
    has_many_attached :images
  
    scope :availables, -> {where(available: true)}
    scope :unavailables, -> {where(available: false)}
  end