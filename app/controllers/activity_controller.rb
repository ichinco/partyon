class ActivityController < ApplicationController

  before_action :get_trip

  def get_trip
    @trip = Trip.find(params[:trip_id])
  end

  def index
    @activities = Activity.where(:trip_id=>@trip.id)
  end

  def new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.trip_id = @trip.id
    if @activity.save
      redirect_to trip_activity_path(@trip, @activity)
    else
      render "new"
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  private
  def activity_params
    params.require(:activity).permit(:name, :website, :cost, :type)
  end
end
