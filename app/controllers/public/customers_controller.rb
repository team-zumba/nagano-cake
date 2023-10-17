class Public::CustomersController < ApplicationController
    
    def show
        @customer = Customer.find(params[:id])
        @addresses = @customer.addresses.all
        @orders = @customer.orders.all
    end 
    
    def edit 
        @customer = Customer.find(params[:id])
    end 
    
    def update
        @customer = Customer.find(params[:id])
        @customer.update(customer_params)
        redirect_to edit_public_customer(@customer.id)
    end 
    
    def confirmation
    end 
    
    private
    
    def customer_params
        params.require(:customer).permit(:email, :last_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
    end 

end
