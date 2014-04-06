class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def pretrip
    @trip = Trip.find(params[:trip_id])
    @trip_user_record = TripUser.where(:trip_id=>@trip.id).where(:user_id=>current_user.id).first
    @is_user_guest = @trip_user_record.present?
    @is_user_admin = @trip_user_record.role == "planner"
  end
end
