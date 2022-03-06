class CartItemsController < ApplicationController
  def index
    @cart_items=current_customer.cart_items.all
    @totalpayment=0
    @total=0
  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: @cart_item.item_id).present?
      cart_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
      total = cart_item.amount + @cart_item.amount.to_i
      cart_item.update(amount: total)

    else
      @cart_item.save
      # flash[:notice] = "商品の個数が変更されました！"
      # ,notice:'商品が追加されました'
    end
    redirect_to cart_items_path
  end

  # def update
  #   @items = Item.all
  #   if @item.update(item_params)
  #   redirect_to new_orders_path,notice:'You have updeted user successfully.'
  #   else
  #   flash.now[:alert]='update error'
  #   render :edit
  #   end
  # end

   def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :index
    end
   end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    @cart_items=CartItem.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
end

  # private
  # def item_params
  #   params.require(:item).permit(:, )
  # end
private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
end