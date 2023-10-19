class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
  end
  
  def check
    @order = Order.new(order_params)
    
    if params[:order][:address_type] == "member_address"
        @order.name = current_customer.last_name + current_customer.first_name
        @order.address = current_customer.address
       
    elsif params[:order][:address_type] == "registered_address"
        @order.name = Address.find(params[:order][:address_id]).name
        @order.address = Address.find(params[:order][:address_id]).address
        
    elsif params[:order][:address_type] == "new_address"
        address_new = current_customer.addresses.new(order_params)
        if !address_new.save 
        render :new
        end
    else
      redirect_to orders_new_path
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
    if params[:order][:payment_method] == "credit_card"
      @payment_method = "クレジットカード"
    else 
      @payment_method = "銀行振込"
    end
  
  end
  
  def complete
  end
  
  def create
    
    
  end
  
  def index
  end
  
  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:name, :address, :total_payment, :postal_code)
  end
  
  
end
