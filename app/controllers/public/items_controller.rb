class ItemsController < ApplicationController
  def index
    @genres=Genre.all
    @items=Item.page(params[:page]).reverse_order.per(8)
  end

  def show
    @cart_item=CartItem.new
    @genres=Genre.all
    @item=Item.find(params[:id])
    # @item=Item.find(params[:id])

  end


end
