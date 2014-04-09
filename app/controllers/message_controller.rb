class MessageController < ApplicationController
  include EventHelper

  before_action :authenticate_user!
  before_action :pretrip
  before_action :require_trip_admin

  def new
    @recipients = @trip.trip_users.map do |tu|
      tu.user.email
    end
  end

  def index
    @messages = Message.where(:trip_id=>@trip.id)
  end

  def show
    @message = Message.find(params[:id])
    @recipients = @trip.trip_users.map do |tu|
      tu.user.email
    end
  end

  def create
    @message = Message.new(message_params)
    @message.trip = @trip
    @message.user = current_user

    if @message.save
      GroupMailer.message_email(@message).deliver
      add_event(current_user, @trip, "#{current_user.name} created sent a message #{@message.subject}")
      redirect_to trip_group_index_path(@trip)
    else
      render 'new'
    end
  end

  private
  def message_params
    params.require(:message).permit(:message, :subject)
  end
end
