require 'time'
class ScheduleController < ApplicationController
  include ActionView::Helpers::TextHelper

  before_action :pretrip
  before_action :authenticate_user!

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
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.trip_id = @trip.id
    if @schedule.save()
      redirect_to trip_schedule_index_path(@trip)
    else
      @activity = @schedule.activity
      flash[:alert] = "#{pluralize(@schedule.errors.count,"error")} prevented this schedule from being created."
      render "new"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @activity = @schedule.activity
    @schedule.destroy
    redirect_to trip_schedule_index_path(@trip)
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    @schedule.save()
    redirect_to trip_schedule_index_path(@trip)
  end

  private
  def schedule_params
    params.require(:schedule).permit(:activity_id, :day, :duration, :start_time)
  end

end
