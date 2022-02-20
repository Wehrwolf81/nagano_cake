class Public::OrdersController < ApplicationController

  def index
    @orders=current_customer.orders.all
  end

  # def show
  #   @order=Order.find(params[:id])
  # end


  def new
    @new_address=Address.new
    @addresses=current_customer.addresses.all
    @order=Order.new
    # @order.address_id=current_customer.address.id

  end

  def confirm
    @total = 0
    @cart_items=current_customer.cart_items
    @order=Order.new(order_params)
    if params[:select_address] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:select_address] == "1"
    @address = Address.find(params[:address][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    else params[:select_address] == "2"
    # @new_address = Address.find(params[:address][:])
    # @order.postal_code =@new_address.postal_code
    # @order.address =@new_address.address
    # @order.name =@new_address .name
    end
    # binding.pry


  end

  def complete

  end

  def create
  　@order = Orders.new(order_params)
  　@cart_items=current_customer.cart_items
　　@order.save
　　current_customer.cart_items.destroy_all
　　redirect_to public_complete_path
  end



private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end