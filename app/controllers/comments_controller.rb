class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/activities/#{comment.activity.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, activity_id: params[:activity_id])
  end
end