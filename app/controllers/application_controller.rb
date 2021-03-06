class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when Customer
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postal_code, :phone_number, :email, :is_deleted])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postal_code, :phone_number, :email, :is_deleted])
  end
end
