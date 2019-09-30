# frozen_string_literal: true

# :nodoc:
class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || new_post_path
  end

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[username password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username email password current_password avatar])
  end
end
