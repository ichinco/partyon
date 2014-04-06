class InvitationController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  before_action :pretrip, only:[:new, :create]
  before_action :require_trip_admin, only:[:new, :create]

  def show
    @trip = Trip.find(params[:trip_id])
    request.env['omniauth.origin'] = new_trip_group_path(@trip)
    session['invitation_id'] = params[:id]
    session['invitation_code'] = params[:code]

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

    if @invitation.save
      redirect_to trip_group_index_path(@trip)
    else
      render 'new'
    end
  end

  private
  def invitation_params
    params.require(:invitation).permit(:name, :email, :role)
  end
end
