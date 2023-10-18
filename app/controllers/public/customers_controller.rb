class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!
    
    def show
        @customer = current_customer
        @addresses = @customer.addresses.all
        @orders = @customer.orders.all
    end 
    
    def edit 
        @customer = current_customer
    end 
    
    def update
        @customer = current_customer
        @customer.update(customer_params)
        redirect_to edit_customer_path(@customer.id)
    end 
    
    def check
        # @customer = current_customer
        # @leave = @customer.is_active == false
    end 
    
    def leave
        current_customer.update(is_active: false)
        # flash[:notice] = "退会しました。"
        redirect_to root_path, notice: "退会しました。"
    end 
    
    private
    
    def customer_params
        params.require(:customer).permit(:email, :last_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
    end 
    
    

end
