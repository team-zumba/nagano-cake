class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  # 小計を求めるメソッド
  def subtotal
    item.item_price * amount
  end

  # 在庫数から0までの配列を返す
  def get_amount_array
    [*0..amount]
  end
end
