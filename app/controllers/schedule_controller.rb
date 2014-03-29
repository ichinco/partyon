class ScheduleController < ApplicationController
  before_action :get_trip

  def get_trip
    @trip = Trip.find(params[:trip_id])
  end

  def new
    @activity = Activity.find(params[:activity_id])
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save()
      redirect_to trip_schedule_index_path(@trip, @activity)
    else
      redirect_to "new"
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:activity_id, :start_time, :end_time)
  end

end
