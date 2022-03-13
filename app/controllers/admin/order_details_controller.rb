class Admin::OrderDetailsController < ApplicationController

  def update


     @order_detail = OrderDetail.find(params[:id])
    # binding.pry
    # @order=Order.find(params[:id])

    if params[:order_detail][:making_status]=="making"
      @order_detail.making_status = params[:order_detail][:making_status]
      # binding.pry
      @order_detail.update(order_detail_params)
        @order_detail.order.status = "making"
        @order_detail.order.update(status:"making")
      redirect_to admin_order_path(@order_detail.order)
    elsif params[:order_detail][:making_status]=="complete"
      @order_detail.making_status = params[:order_detail][:making_status]
      @order_detail.update(order_detail_params)
      if @order_detail.order.order_details.count == @order_detail.order.order_details.where(making_status: "complete").count
        @order_detail.order.status = "ready_to_ship"
        @order_detail.order.update(status:"ready_to_ship")
      end
      redirect_to admin_order_path(@order_detail.order)
    end
  end

private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
  def order_params
    params.require(:order).permit(:order_id, :status)
  end

end
