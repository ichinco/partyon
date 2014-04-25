class CostUserController < ApplicationController
  before_action :authenticate_user!
  before_action :pretrip
  before_action :require_trip_admin

  def destroy
    @cost_user = CostUser.find(params[:id])
    if @cost_user.destroy
      redirect_to trip_cost_index_path(@trip)
    end
  end

  def create
    @cost_user = CostUser.new(cost_user_params)
    @cost_user.cost_id = params[:cost_id]
    @cost_user.trip_id = params[:trip_id]
    if @cost_user.save
      redirect_to trip_cost_index_path(@trip)
    end
  end

  private
  def cost_user_params
    params.require(:cost_user).permit(:user_id)
  end
end
