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
    redirect_to public_customer_path(@customer.id)
    else
    flash.now[:alert]='update error'
    render :edit
    end
  end

  def confirm
  end

  def withdrawal
    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to public_root_path
  end




  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end