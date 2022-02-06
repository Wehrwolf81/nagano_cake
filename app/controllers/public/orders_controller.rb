class Public::OrdersController < ApplicationController
  def new
    @new_address=Address.new
    @addresses=Address.all
  end
  
  def confirm
  end
  
  def complete
  end
  
  def create
  end
  
  def index
  end
  
  def show
  end
end
