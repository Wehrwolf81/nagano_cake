class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @cart_items=current_customer.cart_items.all
  end

  def update_order_status
  end

  def update_making_status
  end
end
