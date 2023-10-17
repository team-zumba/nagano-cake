class Admin::ItemsController < ApplicationController
    
    def new
        @item = Item.new(item_params)
    end 
    
    def create
        @item = Item.new(item_params)
        @item.save
    end 
    
    def index
        @items = Item.all
    end 
    
    def show
        @item = Item.find(params[:id])
    end 
    
    def edit
        @item = Item.find(params[:id])
    end 
    
    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to edit_admin_item_path(@item.id)
    end 
    
end
