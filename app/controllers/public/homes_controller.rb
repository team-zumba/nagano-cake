class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    
    # メインビジュアル用の商品をランダムで3つ取得
    @rand_items = Item.where(is_active: true)
    @rand_items.sample(5)

    # 新規作成順に並び替えて、10件のItemモデルを取得
    @new_items = Item.where(is_active: true)
    @new_items.order(created_at: :desc).limit(10)
  end
end