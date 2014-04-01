class ActivityController < ApplicationController
  before_action :authenticate_user!
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
    activity_id = params[:id]
    @activity = Activity.find(activity_id)
    @comments = Comment.where(:activity_id=>activity_id).order(:created_at)
  end

  private
  def activity_params
    params.require(:activity).permit(:name, :website, :cost, :activity_type)
  end
end
