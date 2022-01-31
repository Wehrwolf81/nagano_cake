class Admin::CustomersController < ApplicationController
  def index
    @customers=Custome.all
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    redirect_to customer_path(@customer.id),notice:'You have updeted user successfully.'
    else
    flash.now[:alert]='update error'
    render :edit
    end
  end
end
  private
  def customer_params
    params.require(:customer).permit(:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted )
  end