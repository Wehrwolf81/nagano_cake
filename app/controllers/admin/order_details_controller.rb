class Admin::OrderDetailsController < ApplicationController

  def update
    # binding.pry

     @order_detail = OrderDetail.find(params[:id])
    if params[:order_detail][:making_status]=="making"
      @order_detail.making_status = params[:order_detail][:making_status]
      # binding.pry
      @order_detail.update(order_detail_params)
      @order=Order.find(params[:id])


        @order.status = "making"
        @order.update(status:"making")
      redirect_to admin_order_path(@order.id)
    elsif params[:order_detail][:making_status]=="complete"
      @order_detail.status = params[:order_detail][:making_status]
      @order_detail.update(order_detail_params)
         @order=Order.find(params[:id])
      if @order.order_details.count == @order.order_details.where(making_status: "発送準備中").count
        order.status = "ready_to_ship"
        order.update(status:"ready_to_ship")
      end
      redirect_to admin_order_path(@order.id)
    end
  end

private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
