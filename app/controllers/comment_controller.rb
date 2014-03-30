class CommentController < ApplicationController

  def create
    trip_id = params[:trip_id]
    activity_id = params[:activity_id]
    @comment = Comment.new(comment_params)
    @comment.activity_id = activity_id

    if @comment.save
      redirect_to trip_activity_path(trip_id,activity_id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
