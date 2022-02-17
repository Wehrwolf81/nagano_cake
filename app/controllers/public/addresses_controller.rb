class Public::AddressesController < ApplicationController
  def index
    @new_address=Address.new
    @addresses=A  ddress.all
  end

  def edit
    @address=Address.find(params[:id])
  end

  def create
    @new_address=Address.new(address_params)
    if @new_address.save
    redirect_to public_addresses_path
    else
    render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @customer.update(customer_params)
    redirect_to public_addresses_path
    else
    flash.now[:alert]='update error'
    render :edit
    end
  end

  def destroy
    @address=Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end
end

 private
  def address_params
    params.require(:address).permit(:id, :name, :postal_code, :address)
  end