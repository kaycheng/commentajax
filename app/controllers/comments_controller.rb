class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_story, only: :create

  def create
    @comment = @story.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      render js: "alert('OK')"
    else
      render js: "alert('Error')"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:message)
  end

  def find_story
    @story = Story.find(params[:story_id])
  end
end