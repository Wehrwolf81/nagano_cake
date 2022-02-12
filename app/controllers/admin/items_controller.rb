class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    @new_item=Item.new
  end

  def create
    @new_item=Item.new(item_params)
    if @new_item.save
    redirect_to items_path,notice:'Book was successfully created.'
    else
    render :new
    end
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item =Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to admin_item_path,notice:'You have updeted user successfully.'
    else
    flash.now[:alert]='update error'
    render :edit
    end
  end

end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active)
  end
