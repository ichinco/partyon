class CostController < ApplicationController
  include ActionView::Helpers::TextHelper

  before_action :get_trip
  before_action :authenticate_user!

  def get_trip
    @trip = Trip.find(params[:trip_id])
  end

  def new
    @cost = Cost.new()
  end

  def create
    @cost = Cost.new(cost_parameters)
    @cost.trip = @trip
    if @cost.save
      redirect_to trip_cost_index_path(@trip)
    else
      flash[:alert] = "#{pluralize(@cost.errors.count,"error")} prevented this cost from being created."
      render 'new'
    end
  end

  def index
    @costs = Cost.where(trip_id: @trip.id)
    @total = @costs.inject(0) do |sum, cost|
      if cost.actual_amount.nil? and not cost.estimated_amount.nil?
        sum + cost.estimated_amount
      elsif not cost.estimated_amount.nil?
        sum + cost.actual_amount
      else
        sum
      end
    end

  end

  private
  def cost_parameters
    params.require(:cost).permit(:description, :actual_amount)
  end
end
