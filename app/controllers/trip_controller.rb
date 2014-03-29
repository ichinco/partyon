class TripController < ApplicationController

  def index
    @trips = Trip.all
  end

  def create
    @trip = Trip.new(trip_parameters)
    if @trip.save()
      redirect_to trip_path(@trip)
    else
      render 'new'
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private
  def trip_parameters
    params.require(:trip).permit(:title,:location,:length,:date)
  end
end
