class ApplicationController < ActionController::Base
  respond_to :js, :html
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    address = [:address]
    devise_parameter_sanitizer.permit :sign_up, keys: address
  end

  def user_or_coop_signed_in?
    user_signed_in? || cooperative_signed_in?
  end
end
