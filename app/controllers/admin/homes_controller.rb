class Admin::HomesController < ApplicationController

  def top
      @customers=Customer.page(params[:page]).reverse_order
      # @order=Order.find(params[:id])
  end


end
