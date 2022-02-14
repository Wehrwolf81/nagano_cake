class Public::OrdersController < ApplicationController
  def new
    # @new_address=Address.new
    @addresses=Address.all
    @order=Order.new
    # @order.address_id=current_customer.address.id

  end

  def confirm
    @order=Order.find(params[:id])

  end

  def complete
  end

  def create
  　@order = current_customer.orders.new(order_params)
　　@order.save
  end

  def index
    @orders=Order.all
  end

  def show
    @order=Order.find(params[:id])
  end
end

private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
