class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { unpaid: 0, payment_confirmed: 1, making: 2, shipping_in_process: 3, shipping_complete: 4 }
  
  validates :address, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :total_payment, presence: true
  validates :status, presence: true
  validates :payment_method, presence: true


   def item_price
    (price * 1.1).floor
   end
end
