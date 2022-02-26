class Admin::HomesController < ApplicationController

  def top
      @orders=Order.all
      # @order=Order.find(params[:id])
      # @customer = Customer.find(params[:id])
      # @order_details=@orders.order_details
  end


end
