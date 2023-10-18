class Public::ItemsController < ApplicationController
    
    def index
        @items = Item.all
        @select_genre_name = '商品'
        @genres = Genre.all
    end
    
    def show
        @item = Item.find(params[:id])
    end 

    def genre
        @genres = Genre.all
        @select_genre_name = Genre.find(params[:id]).name
        @items = Item.where(genre_id: params[:id])
    end
    
    private
    
    def item_params
        params.require(:item).permit(:name, :introduction, :image, :price)
    end 
end
