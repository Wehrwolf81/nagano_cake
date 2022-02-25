class Public::HomesController < ApplicationController
  def top
    @genres=Genre.all
    @items=Item.all
  end

  def about
    # @item=Item.image_id
  end
end
