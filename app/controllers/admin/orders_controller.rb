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
    @order_details=@order.order_details
    @total = 0
    if params[:order][:status]=="confirmation"
      @order.status = params[:order][:status]
      @order.update(order_params)
      # @order.order_details.each do |order_detail|
      #   order_detail.making_status = "waiting"
      #   order_detail.update(making_status:"waiting")
      # end
      @order.order_details.update(making_status:"waiting")
      redirect_to admin_order_path(@order.id)
    else
      render :show
    end
    @order.update(order_params)
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

