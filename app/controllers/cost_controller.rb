class CostController < ApplicationController
  before_action :get_trip
  before_action :authenticate_user!

  def get_trip
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @cost = Cost.new(cost_parameters)
    @cost.trip = @trip
    if @cost.save
      redirect_to trip_cost_index_path(@trip)
    else
      render 'new'
    end
  end

  def index
    @costs = Cost.where(trip_id: @trip.id)
  end

  private
  def cost_parameters
    params.require(:cost).permit(:description, :actual_amount)
  end
end
