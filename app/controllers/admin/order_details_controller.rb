class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = Order.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to admin_order_path(@order.id)
    else
      render :show
    end
  end
end

private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
