class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def create
    @addresses = current_customer.addresses
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
      render :index
    end
  end
  
  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end
  
  def destroy
    address = Address.find(params[:id])  
    address.destroy  
    redirect_to addresses_path
  end
  
  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end
  
end
