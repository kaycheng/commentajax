class StoriesController < ApplicationController

  def index
    @stories = Story.order(created_at: :desc).includes(:user)
  end

  def new
    @story = current_user.stories.new
  end

  def create
    @story = current_user.stories.new(stories_params)
    if @story.save
      redirect_to root_path, notice: "Create new story."
    else
      render new_story_path, notice: "Some errors occured."
    end
  end

  def show
    @story = Story.find(params[:id])
    @comment = @story.comments.new
    @comments = @story.comments.order(created_at: :desc)
  end

  private

  def stories_params
    params.require(:story).permit(:title, :content)
  end
end