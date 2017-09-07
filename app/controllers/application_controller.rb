class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:age])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:location])
    devise_parameter_sanitizer.permit(:account_update, keys: [:location])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:comment])
    devise_parameter_sanitizer.permit(:account_update, keys: [:comment])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image])
  end
end
