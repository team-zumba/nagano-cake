class Admin::HomesController < ApplicationController
    before_action :authenticate_admin!
    
    def index
        @orders = Order.all
    end 
end
