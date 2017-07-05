class CommentsController < ApplicationController
  def create
  	comment = Comment.create comment_params
  	if comment.save
  		redirect_to event_path(params[:comment][:event_id]),
  		flash: {success: "Comment Added"}
  	else
  		redirect_to event_path(params[:comment][:event_id]),
  		flash: { danger: "Error"}
  	end
  end

  def destroy
  end

 private

  def comment_params
  	params.require(:comment).permit(:message, :event_id, :user_id)
  end
end
