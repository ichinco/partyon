class TripController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = TripUser.where(:user_id => current_user.id).map do |tu|
      tu.trip
    end
  end

  def create
    @trip = Trip.new(trip_parameters)
    if @trip.save()
      @trip_user = TripUser.new()
      @trip_user.trip = @trip
      @trip_user.user = current_user
      @trip_user.role = "planner"
      @trip_user.save()
      redirect_to trip_path(@trip)
    else
      render 'new'
    end
  end

  def show
    @trip = Trip.find(params[:id])

    @schedules = Schedule.where(:trip_id=>@trip.id).order(:day).order(:start_hour).order(:start_minute)
  end

  private
  def trip_parameters
    params.require(:trip).permit(:title,:location,:length,:date)
  end
end
