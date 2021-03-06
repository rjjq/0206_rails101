class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.for(:sign_up) do |user_params| 
      user_params.permit(:name, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.for(:account_update) do |user_params| 
      user_params.permit(:name, :email, :password, :password_confirmation, :current_password)
    end
  end
end
