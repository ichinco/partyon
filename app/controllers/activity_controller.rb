class ActivityController < ApplicationController

  def index
    @trip_id = params[:trip_id]
    @activities = Activity.where(:trip_id=>@trip_id)
  end

  def new
    @trip_id = params[:trip_id]
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.trip_id = params[:trip_id]
    if @activity.save
      redirect_to trip_activity_path(params[:trip_id], @activity)
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
