class Admin::SearchesController < ApplicationController
  def customers_search
    @word = params[:word]
    @customers = Customer.where('last_name LIKE? OR first_name LIKE?', "%#{params[:word]}%", "%#{params[:word]}%").page(params[:page])
  end
end
