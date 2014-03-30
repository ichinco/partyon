class ScheduleController < ApplicationController
  before_action :get_trip
  before_action :authenticate_user!

  def get_trip
    @trip = Trip.find(params[:trip_id])
  end

  def index
    @schedules = Schedule.where(:trip_id=>@trip.id)
    @schedule_hash = {}
    (1 .. @trip.length).each do |day|
      @schedule_hash[day] = {}
      (0 .. 23).each do |hour|
        @schedule_hash[day][hour] = []
      end
    end

    @schedules.each do |schedule|
      @schedule_hash[schedule.day][schedule.start_hour].append(schedule)
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
      redirect_to trip_schedule_index_path(@trip, @activity)
    else
      redirect_to "new"
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:activity_id, :day, :duration, :start_hour, :start_minute)
  end

end
