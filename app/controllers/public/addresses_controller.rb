class Public::AddressesController < ApplicationController
  def index
    @new_addresse=Addresse.new
    @addresses=Addresse.all
  end
  
  def edit
    @address=Address.find(params[:id])
  end
  
  def create
    @new_addresse=Address.new(address_params)
    if @new_address.save
    redirect_to address_path,notice:'Book was successfully created.'
    else
    render :index
    end
  end
  
  def update
    @address = Address.find(params[:id])
    if @customer.update(customer_params)
    redirect_to customer_path(@customer.id),notice:'You have updeted user successfully.'
    else
    flash.now[:alert]='update error'
    render :edit
    end
  end
  
  def destroy
    @address=Address.find(params[:id])
    @address.destroy
    redirect_to address_path, notice:'Book was successfully destroyed'
  end
end
