class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    # メインビジュアル用の商品をランダムで3つ取得
    @rand_items = Item.all.sample(5)
    # 新規作成順に並び替えて、10件のItemモデルを取得
    @new_items = Item.order(created_at: :desc).limit(10)
  end
end