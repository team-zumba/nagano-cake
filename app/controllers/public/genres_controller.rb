class Public::GenresController < ApplicationController
  def fliter
    if params[:id] == '0'
      # 全商品のジャンルが選ばれた場合
      @items = Item.all
      
    else
      # その他のジャンルが選ばれた場合
      @items = Item.where(genre_id: params[:id])
    end
  end
end
