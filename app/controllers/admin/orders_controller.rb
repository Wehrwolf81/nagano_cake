class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    # @order_details=Order.find(params[:id])
    # @cart_items=current_customer.cart_items.all
    @order_details=@order.order_details
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order.id)
    else
      render :show
    end
  end

  # def update
  #     @order_detail = Order.find(params[:id])
  #   if @order_detail.making_status.update(order_detail_params)
  #     redirect_to admin_order_path(@order.id)
  #   else
  #     render :show
  #   end
  # end
end

 private
  def order_params
    # binding.pry
    params.require(:order).permit(:status)
  end

