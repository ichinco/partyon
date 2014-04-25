class ReimbursementController < ApplicationController
  before_action :authenticate_user!
  before_action :pretrip

  def index
    @trip_users = TripUser.where(:trip_id => @trip.id)
    @paid = Cost.where(:trip_id => @trip.id).where(:user_id=>current_user.id)
    @owe = CostUser.where(:trip_id => @trip.id).where(:user_id=>current_user.id)
  end
end
