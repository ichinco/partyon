class CostUserController < ApplicationController
  before_action :authenticate_user!
  before_action :pretrip
  before_action :require_trip_admin

  def create
    @successful = false
    if params[:user_id].to_f > 0
      @trip_user = TripUser.where(:trip_id=>@trip.id, :user_id=>params[:user_id])
      unless @trip_user.first.nil?
        @successful = add_or_delete_user(params[:user_id], params[:cost_id], params[:trip_id], params[:owes])
      end
    else
      @trip_users = TripUser.where(:trip_id=>@trip.id)
      @successful = true
      @trip_users.each do |u|
        @successful = @successful && add_or_delete_user(u.user.id, params[:cost_id], params[:trip_id], params[:owes])
      end
    end

    render json:{"success" => @successful}
  end

  private
  def add_or_delete_user(user_id, cost_id, trip_id, owes)
    if owes == "true"
      @cost_user = CostUser.new()
      @cost_user.cost_id = cost_id
      @cost_user.user_id = user_id
      @cost_user.trip_id = trip_id
      @successful = @cost_user.save
    else
      @cost_user = CostUser.where(:cost_id=> params[:cost_id], :trip_id=>params[:trip_id])
      @cost_user.each do |u|
        @successful = @successful && u.destroy
      end
    end

    @successful
  end
end
