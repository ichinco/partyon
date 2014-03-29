class GroupController < ApplicationController
  before_action :get_trip

  def get_trip
    @trip = Trip.find(params[:trip_id])
  end
end
