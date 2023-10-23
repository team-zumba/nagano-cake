class Item < ApplicationRecord
    has_many :order_details
    belongs_to :genre
    has_many :cart_items,dependent: :destroy
    has_many :customers, through: :cart_items
    
  has_one_attached :image
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
  
  def item_price
    (price * 1.1).floor
  end
end
