class TripController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = TripUser.where(:user_id => current_user.id).order(created_at: :desc).map do |tu|
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
    @trip_user_record = TripUser.where(:trip_id=>@trip.id).where(:user_id=>current_user.id).first
    @is_user_guest = @trip_user_record.present?

    unless @is_user_guest
      redirect_to trip_index_path
      return
    end

    @schedules = Schedule.where(:trip_id=>@trip.id).order(:day, :start_time)
    @events = Event.where(:trip_id=>@trip.id).order(created_at: :desc)
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_parameters)
    @trip.save
    redirect_to trip_path(@trip)
  end

  private
  def trip_parameters
    params.require(:trip).permit(:title,:location,:length,:start_date)
  end
end
