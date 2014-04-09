class InvitationController < ApplicationController
  include EventHelper

  before_action :authenticate_user!, only:[:new, :create, :destroy]
  before_action :pretrip, only:[:new, :create, :destroy]
  before_action :require_trip_admin, only:[:new, :create, :destroy]

  def show
    @trip = Trip.find(params[:trip_id])
    session[:after_sign_in] = new_trip_group_path(@trip)
    request.env['omniauth.origin'] = new_trip_group_path(@trip)
    session['invitation_id'] = params[:id]
    session['invitation_code'] = params[:code]
    session['invitation_trip'] = params[:trip_id]

    if current_user.present?
      redirect_to new_trip_group_path(@trip)
      return
    end
  end

  def new
    @invitation = Invitation.new()
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.code = (0...32).map { (65 + rand(26)).chr }.join
    @invitation.trip = @trip
    @invitation.status = false
    @invitation.user = current_user

    add_event(current_user, @trip, "#{current_user.name} invited #{@invitation.name}")

    if @invitation.save
      InvitationMailer.invitation_email(@invitation).deliver
      redirect_to trip_group_index_path(@trip)
    else
      render 'new'
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to trip_group_index_path(@trip)
  end

  private
  def invitation_params
    params.require(:invitation).permit(:name, :email, :role, :message)
  end
end
