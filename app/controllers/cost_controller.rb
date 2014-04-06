class CostController < ApplicationController
  include ActionView::Helpers::TextHelper

  before_action :pretrip
  before_action :authenticate_user!
  before_action :require_trip_admin, only:[:new, :create, :update]

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
      if not cost.actual_amount.nil?
        sum + cost.actual_amount
      elsif not cost.estimated_amount.nil?
        sum + cost.estimated_amount
      else
        sum
      end
    end

  end

  def update
    @cost = Cost.find(params[:id])
    @cost.update(cost_parameters)
    @cost.save
    redirect_to trip_cost_index_path(@trip)
  end

  private
  def cost_parameters
    params.require(:cost).permit(:description, :actual_amount)
  end
end
