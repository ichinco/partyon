class CostUserController < ApplicationController
  before_action :authenticate_user!
  before_action :pretrip
  before_action :require_trip_admin

  def create
    @successful = false
    if params[:owes] == "true"
      @cost_user = CostUser.new()
      @cost_user.cost_id = params[:cost_id]
      @cost_user.user_id = params[:user_id]
      @cost_user.trip_id = params[:trip_id]
      @successful = @cost_user.save
    else
      @cost_user = CostUser.where(:cost_id=> params[:cost_id], :trip_id=>params[:trip_id])
      @cost_user.each do |u|
        @successful = @successful && u.destroy
      end
    end

    render json:{"success" => @successful}
  end
end
