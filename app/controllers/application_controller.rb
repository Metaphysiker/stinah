class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #after_action :track_action

  protected

  def track_action
    ahoy.track "Ran action", request.path_parameters
  end

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :city, :street, :plz, :phone ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    #current_user.is_a?(Admin) ? admin_tests_path : (stored_location_for(resource) || root_path)
    root_path
  end
end
