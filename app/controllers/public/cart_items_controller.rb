class Public::CartItemsController < ApplicationController
    
    def index
        
    end
    
    def create
        redirect_to public_cart_items_path
    end 
    
end
