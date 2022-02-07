class Public::AddressesController < ApplicationController
  def index
    @new_address=Address.new
    @addresses=Address.all
  end
  
  def edit
    @address=Address.find(params[:id])
  end
  
  def create
    @new_address=Address.new(address_params)
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

 private
  def address_params
    params.require(:address).permit(:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address)
  end