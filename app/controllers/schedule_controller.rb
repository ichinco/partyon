require 'time'
class ScheduleController < ApplicationController
  before_action :get_trip
  before_action :authenticate_user!

  def get_trip
    @trip = Trip.find(params[:trip_id])
  end

  def index
    @schedules = Schedule.where(:trip_id=>@trip.id).order(:day, :start_time)
    @schedule_hash = {}
    (1 .. @trip.length).each do |day|
      @schedule_hash[day] = []
    end

    @schedules.each do |schedule|
      @schedule_hash[schedule.day].append(schedule)
    end

    @schedule_hash
  end

  def new
    @activity = Activity.find(params[:activity_id])
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.trip_id = @trip.id
    if @schedule.save()
      redirect_to trip_schedule_index_path(@trip)
    else
      redirect_to "new"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @activity = @schedule.activity
    @schedule.destroy
    redirect_to trip_activity_path(@trip, @activity)
  end

  private
  def schedule_params
    params.require(:schedule).permit(:activity_id, :day, :duration, :start_time)
  end

end
