class Public::GenresController < ApplicationController
  def fliter
    if params[:id] == '0'
      # 全商品のリンクが選択された場合
      @items = Item.all
      @genre_name = '商品'
      
    else
      # その他のジャンルのリンクが選択選ばれた場合
      @items = Item.where(genre_id: params[:id])
      @genre_name = Genre.find(params[:id]).name
    end
  end
end
