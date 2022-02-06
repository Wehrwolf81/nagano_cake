class Public::CartItemsController < ApplicationController
  def index
    @cart_items=cart_item.all
  end
  
  def create
    @cart_items.save
    redirect_to root_path,notice:'Book was successfully created.'
  end
  
  def update
    @items = Item.all
    if @item.update(item_params)
    redirect_to new_orders_path,notice:'You have updeted user successfully.'
    else
    flash.now[:alert]='update error'
    render :edit
    end
  end
  
  def destroy
    @cart_item=Cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice:'Book was successfully destroyed'
  end
  
  def all_destroy
    @cart_items=Cart_item.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path, notice:'Book was successfully destroyed'
  end
end
