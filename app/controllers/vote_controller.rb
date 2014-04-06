class VoteController < ApplicationController
  before_action :authenticate_user!
  before_action :pretrip

  def create
    @poll = Poll.find(params[:poll_vote][:poll_id])
    @poll_choice = PollChoise.find(params[:poll_vote][:poll_choise_id])

    @vote = PollVote.new()
    @vote.poll = @poll
    @vote.user = current_user
    @vote.poll_choise = @poll_choice

    @vote.save()

    redirect_to trip_poll_path(@trip, @poll)
  end
end
