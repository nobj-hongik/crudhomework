class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:teamname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:region])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:typeofsports])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:teamname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:region])
    devise_parameter_sanitizer.permit(:account_update, keys: [:typeofsports])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image])
  end
end