class Admin::OrdersController < ApplicationController
    
    def customer_index
        @customer = Customer.find(params[:id])
        @orders = @customer.orders.page(params[:page])
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
        if params[:order][:status] == "payment_confirmed"
            @order.order_details.each do |order_detail|
                order_detail.update(making_status: "waiting_for_making")
            end 
        end 
        redirect_to admin_order_path(@order.id), notice: '更新に成功しました。'
    end 
    
    private
    
    def order_params
        params.require(:order).permit(:status)
    end 
    
end
