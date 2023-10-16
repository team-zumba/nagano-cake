class Public::ItemsController < ApplicationController
    
    def index
        @items = Item.all
        @genres = Genre.all
        @genre_name = '商品'
    end
    
    def show
        @item = Item.find(params[:id])
    end 
    
    private
    
    def item_params
        params.require(:item).permit(:name, :introduction, :image, :price)
    end 
    
    
end
