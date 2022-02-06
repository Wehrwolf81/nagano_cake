class Public::RegistrationsController < ApplicationController
  def new
    @new_registration=Registrations.new
  end
  
  def create
  end
  
end
