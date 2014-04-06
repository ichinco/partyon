class RegistrationsController < Devise::RegistrationsController
  def after_sign_in_path_for(resource)
    session[:after_sign_in] || stored_location_for(resource) || root_path
  end

  def after_inactive_sign_up_path_for(resource)
    session[:after_sign_in] || stored_location_for(resource) || root_path
  end
end