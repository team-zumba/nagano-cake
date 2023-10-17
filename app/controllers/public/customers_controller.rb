class Public::CustomersController < ApplicationController
    
    def show
        @customer = current_customer
        @addresses = @customer.addresses.all
        @orders = @customer.orders.all
    end 
    
    def edit 
        @customer = current_customer
    end 
    
    def update
        @customer = Customer.find(params[:id])
        @customer.update(customer_params)
        redirect_to edit_customer_path(@customer.id)
    end 
    
    def check
    end 
    
    private
    
    def customer_params
        params.require(:customer).permit(:email, :last_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
    end 

end
