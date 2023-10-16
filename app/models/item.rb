class Item < ApplicationRecord
    has_many :order_details
    has_many :genres
    has_many :cart_items
    has_many :customers, through: :cart_items
    
  has_one_attached :image
end
