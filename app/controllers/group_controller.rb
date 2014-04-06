class GroupController < ApplicationController
  include ActionView::Helpers::TextHelper

  before_action :authenticate_user!
  before_action :pretrip
  before_action :require_trip_admin, only:[:new, :update, :destroy]

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

    @invitation = Invitation.find(session[:invitation_id])
  end

  def create
    @invitation = Invitation.find(params[:trip_user][:invitation_id])
    code = params[:trip_user][:invitation_code]
    unless code == @invitation.code && @invitation.trip == @trip
      flash[:alert] = "Invalid invitation."
      redirect_to trip_index_path
      return
    end

    @group_user = TripUser.new(group_params)
    @group_user.trip = @trip
    @group_user.user = current_user
    @group_user.role = @invitation.role

    if @group_user.save
      redirect_to trip_path(@trip)
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
