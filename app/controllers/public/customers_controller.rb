class Public::CustomersController < ApplicationController
  def show
    @customer=current_customer
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    logger.debug(@customer.inspect)
    if @customer.update!(customer_params)
    redirect_to public_customer_path(@customer.id),notice:'You have updeted user successfully.'
    else
    flash.now[:alert]='update error'
    render :edit
    end
  end

  def confirm
  end

  def withdrawal
  end


  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end