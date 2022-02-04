class Public::CartItemsController < ApplicationController
  def index
    @cart_items=item.all
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
  
  def all_destroy
  end
end
