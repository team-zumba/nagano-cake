class Public::ItemsController < ApplicationController
    
    def index
        @items = Item.where(is_active: true)
        @select_genre_name = '商品'
        @genres = Genre.all
    end
    
    def show
        @item = Item.find(params[:id])
        if @item.is_active
            @cart_item = CartItem.new
        else
            redirect_to items_path
        end
    end 

    def genre
        @genres = Genre.all
        @select_genre_name = Genre.find(params[:id]).name
        @items = Item.where(genre_id: params[:id], is_active: true)
    end
    
    private
    
    def item_params
        params.require(:item).permit(:name, :introduction, :image, :price)
    end 
end
