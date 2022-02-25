class Public::OrdersController < ApplicationController

  def index
    # @order.shipping_cost = 800
    @orders=current_customer.orders.all
    # @order_details = current_customer.order_detail.new(order_detail_params)
    @total = 0
  end

  def show
    # @order_detail = OrderDetail.new(order_details_params)
    @order=Order.find(params[:id])
    # @cart_items=current_customer.cart_items
    @order_details=current_customer.cart_items

    # @order_details=current_customer.order_details.all

  end


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
    @order = current_customer.orders.new(order_params)
    @cart_items=current_customer.cart_items
    if @order.save
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item.id
        @order_detail.amount = cart_item.amount
        @order_detail.price = cart_item.item.price
        @order_detail.save
      end
      redirect_to public_complete_path
      current_customer.cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new

    end
  end



private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :amount, :price)
  end

end