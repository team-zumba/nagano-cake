class Admin::ItemsController < ApplicationController
    
    def new
        @item = Item.new(item_params)
        @genres = Genre.all
        select_genres = @genres.pluck(:name)
        
        @select_array = []
        select_genres.each_with_index do |genre_name, i|
            genre_array = [genre_name, i + 1]
            @select_array.push(genre_array)
        end 
    end 
    
    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to admin_item_path(@item.id)
    end 
    
    def index
        @items = Item.all
    end 
    
    def show
        @item = Item.find(params[:id])
    end 
    
    def edit
        @item = Item.find(params[:id])
        @genres = Genre.all
        select_genres = @genres.pluck(:name)
        
        @select_array = []
        select_genres.each_with_index do |genre_name, i|
            genre_array = [genre_name, i + 1]
            @select_array.push(genre_array)
        end 
    end 
    
    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to edit_admin_item_path(@item.id)
    end 
    
    private
    
    def item_params
        params.permit(:name, :genre_id, :introduction, :image, :price, :is_active)
    end 
    
end
