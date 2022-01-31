class Public::AddressesController < ApplicationController
  def index
    @new_addresse=addresse.new
    @addresses=addresse.all
  end
  
  def edit
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
end
