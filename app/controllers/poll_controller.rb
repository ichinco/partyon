class PollController < ApplicationController
  before_action :authenticate_user!
  before_action :pretrip
  before_action :require_trip_admin, only:[:new, :create]

  def new
    @poll = Poll.new()
    10.times { @poll.poll_choises.build }
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.trip = @trip

    if @poll.save
      redirect_to trip_poll_index_path(@trip)
    else
      render 'new'
    end
  end

  def index
    @polls = Poll.where(:trip_id => @trip.id)
  end

  def show
    @poll = Poll.find(params[:id])
    @poll_vote = PollVote.where(:poll_id => @poll.id).where(:user_id=> current_user.id).first
  end

  private
  def poll_params
    params.require(:poll).permit(:question, :description,
                                :poll_choises_attributes => [:description])
  end

end
