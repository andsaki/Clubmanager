class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])

    devise_parameter_sanitizer.permit(:account_update, keys: [:age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:location])
    devise_parameter_sanitizer.permit(:account_update, keys: [:comment])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:month])
    devise_parameter_sanitizer.permit(:account_update, keys: [:day])
    devise_parameter_sanitizer.permit(:account_update, keys: [:sex])
    devise_parameter_sanitizer.permit(:account_update, keys: [:state_group_id])
  end
end
