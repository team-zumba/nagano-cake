class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
  end
  
  def check
    @order = Order.new(order_params)
    
    if params[:order][:address_number] == "0"
       @order.name = current_customer.last_name + current_customer.first_name
       @order.address = current_customer.customer_address
       
    elsif params[:order][:address_number] == "1"
        if Address.exists?(name: params[:order][:registered])
          @order.name = Address.find(params[:order][:registered]).name
          @order.address = Address.find(params[:order][:registered]).address
        else
          render :new
        end
        
    elsif params[:order][:address_number] == "2"
        address_new = current_customer.addresses.new(address_params)
        if address_new.save 
        else
        render :new
        end
    else
      redirect_to orders_new_path
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
    
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
    params.require(:order).permit(:name, :address, :total_price)
  end
  
  def address_params
    params.require(:order).permit(:name, :address)
  end
  
end
