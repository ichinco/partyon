class SuggestionController < ApplicationController
  before_action :authenticate_user!

  def create
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user = current_user

    if @suggestion.save
      redirect_to trip_index_path
    else
      render 'new'
    end
  end

  private
  def suggestion_params
    params.require(:suggestion).permit(:message)
  end
end
