class ApplicationController < ActionController::Base

  # before_action :authenticate_customer!, except: [:top, :about]
  # protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email])
    end
end
