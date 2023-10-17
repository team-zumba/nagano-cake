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
    

end
