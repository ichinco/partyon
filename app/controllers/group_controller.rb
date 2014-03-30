class GroupController < ApplicationController
  before_action :get_trip
  before_action :authenticate_user!

  def get_trip
    @trip = Trip.find(params[:trip_id])
  end

  def index
    @users = TripUser.where(:trip_id => @trip.id)
  end

  def create
    @trip_user = TripUser.new()
    @user = User.where(:email=> group_params[:email]).first
    if @user.nil?
      @user = User.new()
      @user.email = group_params[:email]
      @user.save
    end

    @trip_user.trip = @trip
    @trip_user.user = @user

    if @trip_user.save
      redirect_to trip_group_index_path(@trip)
    else
      render 'new'
    end
  end

  private
  def group_params
    params.require(:group_user).permit(:email, :name)
  end
end
