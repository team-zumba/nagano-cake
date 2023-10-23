class Public::SearchesController < ApplicationController
  def items_search
    @word = params[:word]
    @items = Item.where('name LIKE?', '%' + params[:word] + '%')
    @genres = Genre.all
  end
end
