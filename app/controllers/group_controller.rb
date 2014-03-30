class GroupController < ApplicationController
  before_action :get_trip
  before_action :authenticate_user!

  def get_trip
    @trip = Trip.find(params[:trip_id])
  end
end
