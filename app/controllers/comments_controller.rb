class CommentsController < ApplicationController
  def create
  if Comment.create(comment_params)
    comment = Comment.create(comment_params)
    redirect_to "/prototypes/#{comment.prototype.id}"
  else
    render :new
  end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end