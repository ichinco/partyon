class ActivityController < ApplicationController
  include ActionView::Helpers::TextHelper

  before_action :authenticate_user!
  before_action :pretrip

  def index
    @activities = Activity.where(:trip_id=>@trip.id)
  end

  def new
    @activity = Activity.new()
    @activity.schedules.build()
    @activity.costs.build()
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.trip_id = @trip.id
    if @activity.save
      redirect_to trip_activity_path(@trip, @activity)
    else
      flash[:alert] = "#{pluralize(@activity.errors.count,"error")} prevented this activity from being created."
      render 'new'
    end
  end

  def show
    activity_id = params[:id]
    @activity = Activity.find(activity_id)
    @comments = Comment.where(:activity_id=>activity_id).order(:created_at)
    @schedules = Schedule.where(:activity_id=>activity_id).order(:day, :start_time)
  end

  private
  def activity_params
    params.require(:activity).permit(:name, :website, :activity_type, :location,
                                     :schedules_attributes => [:day, :start_time, :trip_id],
                                     :costs_attributes => [:estimated_amount, :trip_id])
  end
end
