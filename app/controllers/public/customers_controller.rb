class Public::CustomersController < ApplicationController
  def show
    @customer=Customer.find(params[:id])
  end 
  
  def edit
    @customer=Customer.find(params[:id])
  end
  
  def update
  end
  
  def confirm
  end
  
  def withdrawal
  end
  
end
