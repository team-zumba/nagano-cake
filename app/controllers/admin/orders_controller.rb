class Admin::OrdersController < ApplicationController
    
    def customer_index
        @customer = Customer.find(params[:id])
    end 
    
    def show
        # @customer = Customer.find(params[:id])
        @order = Order.find(params[:id])
        @order_details = @order.order_details.all
        # @customer = Customer.find(@order.customer_id)
        # @registered_address = @order.address
    end 
    
    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        redirect_to admin_order_path(@order.id)
    end 
    
    private
    
    def order_params
        params.require(:order).permit(:status)
    end 
    
end
