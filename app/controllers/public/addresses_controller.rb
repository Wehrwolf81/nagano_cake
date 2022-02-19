class Public::AddressesController < ApplicationController
  def index
    @new_address=Address.new
    @addresses=current_customer.addresses.all
    p @addresses
  end

  def edit
    @address=Address.find(params[:id])
  end

  def create
    @new_address=Address.new(address_params)
    @new_address.customer_id=current_customer.id
    @addresses=current_customer.addresses.all
    if @new_address.save
    redirect_to public_addresses_path
    else
    render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
    redirect_to public_addresses_path
    else
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