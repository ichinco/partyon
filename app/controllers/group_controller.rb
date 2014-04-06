class GroupController < ApplicationController
  include ActionView::Helpers::TextHelper

  before_action :pretrip
  before_action :authenticate_user!

  def index
    @users = TripUser.where(:trip_id => @trip.id)
  end

  def destroy
    @trip_user = TripUser.find(params[:id])
    @trip_user.destroy
    redirect_to trip_group_index_path(@trip)
  end

  def new
    @group_user = TripUser.new
    @group_user.build_user
  end

  def create
    @group_user = TripUser.new(group_params)
    @group_user.trip = @trip
    @group_user.user.password = (0...8).map { (65 + rand(26)).chr }.join

    if @group_user.save
      redirect_to trip_group_index_path(@trip)
    else
      flash[:alert] = "#{pluralize(@group_user.errors.count,"error")} prevented this user from being created."
      render 'new'
    end
  end

  def update
    @trip_user = TripUser.find(params[:id])
    @trip_user.update(group_update_params)
    @trip_user.save()
    redirect_to trip_group_index_path(@trip)
  end

  private
  def group_params
    params.require(:trip_user).permit(:role,
                                       :user_attributes => [:email, :name])
  end

  private
  def group_update_params
    params.require(:group_user).permit(:role)
  end
end
